library(cvAUC)


### Name: ci.cvAUC
### Title: Confidence Intervals for Cross-validated Area Under the ROC
###   Curve (AUC) Estimates
### Aliases: ci.cvAUC

### ** Examples

# This i.i.d. data example does the following:

# Load a data set with a binary outcome. For the i.i.d. case we use a simulated data set of 
# 500 observations, included with the package, of graduate admissions data. 
# 
# Divide the indices randomly into 10 folds, stratifying by outcome.  Stratification is not 
# necessary, but is commonly performed in order to create validation folds with similar 
# distributions.  Store this information in a list called folds.
# 
# Define a function to fit a model on the training data and to generate predicted values 
# for the observations in the validation fold, for a single iteration of the cross-validation 
# procedure.  We use a logistic regression fit.
# 
# Apply this function across all folds to generate predicted values for each validation fold.  
# The concatenated version of these predicted values is stored in vector called predictions.  
# The outcome vector, Y, is the labels argument. 


iid_example <- function(data, V=10){

  .cvFolds <- function(Y, V){  #Create CV folds (stratify by outcome)
    Y0 <- split(sample(which(Y==0)), rep(1:V, length=length(which(Y==0))))
    Y1 <- split(sample(which(Y==1)), rep(1:V, length=length(which(Y==1))))
    folds <- vector("list", length=V)
    for (v in seq(V)) {folds[[v]] <- c(Y0[[v]], Y1[[v]])}		
    return(folds)
  }
  .doFit <- function(v, folds, data){  #Train/test glm for each fold
    fit <- glm(Y~., data=data[-folds[[v]],], family=binomial)
    pred <- predict(fit, newdata=data[folds[[v]],], type="response")
    return(pred)
  }
  folds <- .cvFolds(Y=data$Y, V=V)  #Create folds
  predictions <- unlist(sapply(seq(V), .doFit, folds=folds, data=data))  #CV train/predict
  predictions[unlist(folds)] <- predictions  #Re-order pred values
  # Get CV AUC and confidence interval
  out <- ci.cvAUC(predictions=predictions, labels=data$Y, folds=folds, confidence=0.95)
  return(out)
}


# Load data
library(cvAUC)
data(admissions)

# Get performance
set.seed(1)
out <- iid_example(data=admissions, V=10) 


# The output is given as follows:
# > out
# $cvAUC
# [1] 0.9046473
# 
# $se
# [1] 0.01620238
# 
# $ci
# [1] 0.8728913 0.9364034
#
# $confidence
# [1] 0.95



