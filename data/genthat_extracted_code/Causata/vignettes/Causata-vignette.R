## ----setup, include=FALSE, cache=FALSE-----------------------------------
# Set global chunk options for knitr documentation
library(knitr)
opts_chunk$set(fig.width=6.5, fig.height=4.5, size="small", tidy=FALSE)

# Generate R code from the sweave/knitr documentation using the purl command as shown below
#purl(input="inst/doc/Causata-vignette.rnw", output="inst/doc/Causata-vignette.R", documentation=0)

## ----eval=FALSE----------------------------------------------------------
#  library(Causata)
#  library(glmnet)
#  
#  # Load data using the SQL interface.
#  # A page view event is selected as a focal point.
#  conn <- Connect(group='fsdemo')
#  query <- paste(
#    'SELECT mortgage_application_approved__n7d, total_assets__AP,',
#    'web_has_browsed_on_ipad__l7d',
#    'FROM Scenarios S, page_view P',
#    'WHERE where S.profile_id = P.profile_id',
#    'AND S.focal_point = P.timestamp',
#    'LIMIT 20000')
#  df <- GetData(conn, query)

## ----eval=FALSE----------------------------------------------------------
#  formula.str <- paste('mortgage_application_approved__n30d ~',
#    'total_assets__AP + web_has_browsed_on_ipad__AP')
#  
#  # Create a CausataData object to track preprocessing steps.
#  causataData <- CausataData(df, 'mortgage_application_approved__n30d')
#  
#  # Remove missing values.
#  causataData <- CleanNaFromContinuous(causataData)
#  causataData <- CleanNaFromFactor(causataData)
#  
#  # build a model
#  modelmatrix <- model.matrix(formula(formula.str), data=causataData$df)
#  cv.glmnet.obj <- cv.glmnet(modelmatrix,
#    causataData$df$mortgage_application_approved__n30d,
#    alpha=0.0, family='binomial')

## ----eval=FALSE----------------------------------------------------------
#  # upload model
#  model.def <- ModelDefinition(
#    cv.glmnet.obj, causataData, formula(formula.str),
#    cv.glmnet.obj$lambda.min)
#  variable.def <- VariableDefinition(
#    name='score-mortgage-application',
#    display.name='Score: Mortgage Application',
#    description='Logistic regression model for demo.', author='Justin',
#    labels='Scores')
#  result <- UploadModel(CausataConfig(group='fsdemo'), model.def,
#    variable.def)

## ----results="hide", message=FALSE---------------------------------------
library(Causata)
library(glmnet)
library(pROC)

# Set a random seed so random numbers are repeated
set.seed(87352)

# Load example data from the Causata package
data(df.causata)

## ------------------------------------------------------------------------
# Set the dependent variable
dvname <- "has.responded.mobile.logoff_next.hour_466"

## ------------------------------------------------------------------------
# Create an index of training data.
idx.train <- sample.int(nrow(df.causata), round(nrow(df.causata)*0.75))
# Split data into training and testing data frames by row.
df.train <- df.causata[ idx.train, ]
df.test  <- df.causata[-idx.train, ]

## ------------------------------------------------------------------------
# Run a univariate analysis for each variable in the data frame
binaryPredictorSummary <- BinaryPredictor(df.train, df.train[[dvname]], 
  min.robustness = 0.1)

# Generate summary information and store it in a data frame.
df.summary <- print(binaryPredictorSummary, silent=TRUE)

## ------------------------------------------------------------------------
# Create a CausataData object with training data.
causataData <- CausataData(df.train[, df.summary$keep], dvname)

## ------------------------------------------------------------------------
# Loop for each variable, apply discretization to nonlinear variables
for (varname in names(causataData$df)){
  if (varname %in% c(dvname)){next} # skip the dependent variable
  # Get summary information for this variable
  idx <- which(varname == df.summary$name)
  # Discretize nonlinear variables where the predictive power is > 0.3
  # and the linearity is < 0.9
  if (df.summary$class[idx] %in% c('integer','numeric') &
      df.summary$predictivePower[idx] > 0.03 &
      abs(df.summary$linearity[idx]) < 0.9){
    # Set outlier limits before discretizing
    causataData <- ReplaceOutliers(causataData, varname, 
      lowerLimit=min(causataData$df[[varname]], na.rm=TRUE), 
      upperLimit=max(causataData$df[[varname]], na.rm=TRUE))
    # Find breakpoints
    bclist <- BinaryCut(causataData$df[[varname]], 
      causataData$df[[dvname]], minBin=0, bins=TRUE)
    # Compute weight of evidence
    woe <- Woe(bclist$fiv, causataData$df[[dvname]])
    # Discretize
    causataData <- Discretize(causataData, varname, bclist$breaks,
      woe$woe.levels)
  }
}

## ------------------------------------------------------------------------
# Replace missing values
causataData <- CleanNaFromContinuous(causataData)
causataData <- CleanNaFromFactor(causataData)

## ------------------------------------------------------------------------
# Merge levels in factors with # levels exceeding a threshold
causataData <- MergeLevels(causataData, max.levels=10)

## ------------------------------------------------------------------------
# Extract a set of independent variable names, exclude the dependent
# variable.
indep.vars <- colnames(causataData$df)
indep.vars <- indep.vars[!(indep.vars == dvname) ]
# Build a formula string
formula.string <- paste(dvname, "~", paste(indep.vars, collapse=" + "))
formula.object <- formula(formula.string)
# Build a model matrix
x.matrix.train <- model.matrix(formula.object, data=causataData$df)
# Set the dependent variable
y.train <- causataData$df[[dvname]]
y.test  <- df.test[[dvname]]

## ------------------------------------------------------------------------
# Get a function that applies transformations to a data frame.
Transformer <- GetTransforms(causataData)
# Apply the transformations to the test data.
df.test.transformed <- Transformer(df.test)

## ----glmnet-diagnostic---------------------------------------------------
# Build model, select alpha value near 1 
# since we expect most coefficients to be zero
cv.glmnet.obj <- cv.glmnet(x.matrix.train, y.train, alpha=0.8, 
  family=c("binomial"))
plot(cv.glmnet.obj)

## ------------------------------------------------------------------------
# Use the model to predict responses for training data
predicted.train <- predict(cv.glmnet.obj, newx=x.matrix.train, 
  type="response", s="lambda.min")

# Compute predictions for test data.
model.def <- ModelDefinition(cv.glmnet.obj, causataData, 
  formula.object, cv.glmnet.obj$lambda.min )
predict.result <- predict(model.def, df.test.transformed)
predicted.test <- predict.result$predicted

## ----roc-plot------------------------------------------------------------
# Compute area under the ROC curve using the pROC package
roc.train <- roc(y.train, predicted.train)
roc.test  <- roc(y.test,  predicted.test )
cat("Training / testing area under ROC curve: ", 
  roc.train$auc, ", ", roc.test$auc, "\n")
plot(roc.test, 
  main=sprintf("ROC plot for glmnet model test data.  AUC=%6.4f", 
  roc.test$auc))

## ------------------------------------------------------------------------
# Prepare to import the model into Causata
variable.def <- VariableDefinition(
  name = "score-test-model", 
  display.name = "Score: Test Model",
  description = "A logistic regression model.",
  author = "Test User" )

# Generate a string of PMML representing the model and 
# preprocessing transformations.
# This step is not required to upload a model, 
# it's shown for illustration purposes only
pmml.string <- ToPmml(model.def, variable.def)

# Upload model to Causata.
# The parameters below are for illustration only.
causata.config <- CausataConfig(
  config.server.host = "123.456.789.10",
  config.server.port = 8002,
  config.username = "testuser",
  config.password = "1234abcd")

## ----eval=FALSE----------------------------------------------------------
#  result <- UploadModel(causata.config, model.def, variable.def)

## ------------------------------------------------------------------------
# extract nonzero coefficients
coefs.all <- as.matrix(coef(cv.glmnet.obj, s="lambda.min"))
idx <- as.vector(abs(coefs.all) > 0)
coefs.nonzero <- as.matrix(coefs.all[idx])
rownames(coefs.nonzero) <- rownames(coefs.all)[idx]

## ----size="tiny"---------------------------------------------------------
print(coefs.nonzero)

