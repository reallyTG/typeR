## ----eval=F--------------------------------------------------------------
#  install.packages("SuperLearner")

## ----eval=F--------------------------------------------------------------
#  # Install devtools first:
#  # install.packages("devtools")
#  devtools::install_github("ecpolley/SuperLearner")

## ----eval=F--------------------------------------------------------------
#  install.packages(c("caret", "glmnet", "randomForest", "ggplot2", "RhpcBLASctl"))

## ----eval=F--------------------------------------------------------------
#  install.packages("xgboost", repos=c("http://dmlc.ml/drat/", getOption("repos")), type="source")

## ----setup-data----------------------------------------------------------
############################
# Setup example dataset.

# Load a dataset from the MASS package.
data(Boston, package = "MASS")

# Review info on the Boston dataset.
?Boston

# Check for any missing data - looks like we don't have any.
colSums(is.na(Boston))

# Extract our outcome variable from the dataframe.
outcome = Boston$medv

# Create a dataframe to contain our explanatory variables.
data = subset(Boston, select = -medv)

# Check structure of our dataframe.
str(data)

# If we had factor variables we would use model.matrix() to convert to numerics.

# Review our dimensions.
dim(data)

# Set a seed for reproducibility in this random sampling.
set.seed(1)

# Reduce to a dataset of 150 observations to speed up model fitting.
train_obs = sample(nrow(data), 150)

# X is our training sample.
X_train = data[train_obs, ]

# Create a holdout set for evaluating model performance.
# Note: cross-validation is even better than a single holdout sample.
X_holdout = data[-train_obs, ]

# Create a binary outcome variable: towns in which median home value is > 22,000.
outcome_bin = as.numeric(outcome > 22)

Y_train = outcome_bin[train_obs]
Y_holdout = outcome_bin[-train_obs]

# Review the outcome variable distribution.
table(Y_train, useNA = "ifany")


## ------------------------------------------------------------------------
library(SuperLearner)

# Review available models.
listWrappers()

# Peek at code for a model.
SL.glmnet

## ----indiv-models--------------------------------------------------------
# Set the seed for reproducibility.
set.seed(1)

# Fit lasso model.
sl_lasso = SuperLearner(Y = Y_train, X = X_train, family = binomial(),
                        SL.library = "SL.glmnet")
sl_lasso

# Review the elements in the SuperLearner object.
names(sl_lasso)

# Here is the risk of the best model (discrete SuperLearner winner).
sl_lasso$cvRisk[which.min(sl_lasso$cvRisk)]

# Here is the raw glmnet result object:
str(sl_lasso$fitLibrary$SL.glmnet_All$object, max.level = 1)

# Fit random forest.
sl_rf = SuperLearner(Y = Y_train, X = X_train, family = binomial(),
                     SL.library = "SL.randomForest")
sl_rf

## ----multiple-models-----------------------------------------------------
set.seed(1)
sl = SuperLearner(Y = Y_train, X = X_train, family = binomial(),
  SL.library = c("SL.mean", "SL.glmnet", "SL.randomForest"))
sl

# Review how long it took to run the SuperLearner:
sl$times$everything

## ----predict-------------------------------------------------------------
# Predict back on the holdout dataset.
# onlySL is set to TRUE so we don't fit algorithms that had weight = 0, saving computation.
pred = predict(sl, X_holdout, onlySL = T)

# Check the structure of this prediction object.
str(pred)

# Review the columns of $library.predict.
summary(pred$library.predict)

# Histogram of our predicted values.
library(ggplot2)
qplot(pred$pred[, 1]) + theme_minimal()

# Scatterplot of original values (0, 1) and predicted values.
# Ideally we would use jitter or slight transparency to deal with overlap.
qplot(Y_holdout, pred$pred[, 1]) + theme_minimal()

# Review AUC - Area Under Curve
pred_rocr = ROCR::prediction(pred$pred, Y_holdout)
auc = ROCR::performance(pred_rocr, measure = "auc", x.measure = "cutoff")@y.values[[1]]
auc

## ----cv-sl, fig.width=5--------------------------------------------------
set.seed(1)

# Don't have timing info for the CV.SuperLearner unfortunately.
# So we need to time it manually.

# We use V = 3 to save computation time; for a real analysis use V = 10 or 20.
system.time({
  # This will take about 3x as long as the previous SuperLearner.
  cv_sl = CV.SuperLearner(Y = Y_train, X = X_train, family = binomial(), V = 3,
                          SL.library = c("SL.mean", "SL.glmnet", "SL.randomForest"))
})

# We run summary on the cv_sl object rather than simply printing the object.
summary(cv_sl)


# Review the distribution of the best single learner as external CV folds.
table(simplify2array(cv_sl$whichDiscreteSL))

# Plot the performance with 95% CIs (use a better ggplot theme).
plot(cv_sl) + theme_bw()

# Save plot to a file.
ggsave("SuperLearner.png")


## ----rf-custom, fig.width=5----------------------------------------------
# Review the function argument defaults at the top.
SL.randomForest

# Create a new function that changes just the ntree argument.
# (We could do this in a single line.)
# "..." means "all other arguments that were sent to the function"
SL.rf.better = function(...) {
  SL.randomForest(..., ntree = 3000)
}

set.seed(1)

# Fit the CV.SuperLearner.
# We use V = 3 to save computation time; for a real analysis use V = 10 or 20.
cv_sl = CV.SuperLearner(Y = Y_train, X = X_train, family = binomial(), V = 3,
                        SL.library = c("SL.mean", "SL.glmnet", "SL.rf.better", "SL.randomForest"))

# Review results.
summary(cv_sl)

## ----rf-create-learner, eval=F-------------------------------------------
#  # Customize the defaults for randomForest.
#  learners = create.Learner("SL.randomForest", params = list(ntree = 3000))
#  
#  # Look at the object.
#  learners
#  
#  # List the functions that were created
#  learners$names
#  
#  # Review the code that was automatically generated for the function.
#  # Notice that it's exactly the same as the function we made manually.
#  SL.randomForest_1
#  
#  set.seed(1)
#  
#  # Fit the CV.SuperLearner.
#  # We use V = 3 to save computation time; for a real analysis use V = 10 or 20.
#  cv_sl = CV.SuperLearner(Y = Y_train, X = X_train, family = binomial(), V = 3,
#                          SL.library = c("SL.mean", "SL.glmnet", learners$names, "SL.randomForest"))
#  
#  # Review results.
#  summary(cv_sl)

## ----rf-mtry, eval=F-----------------------------------------------------
#  # sqrt(p) is the default value of mtry for classification.
#  floor(sqrt(ncol(X_train)))
#  
#  # Let's try 3 multiplies of this default: 0.5, 1, and 2.
#  mtry_seq = floor(sqrt(ncol(X_train)) * c(0.5, 1, 2))
#  mtry_seq
#  
#  learners = create.Learner("SL.randomForest", tune = list(mtry = mtry_seq))
#  
#  # Review the resulting object
#  learners
#  
#  # Check code for the learners that were created.
#  SL.randomForest_1
#  SL.randomForest_2
#  SL.randomForest_3
#  
#  set.seed(1)
#  
#  # Fit the CV.SuperLearner.
#  # We use V = 3 to save computation time; for a real analysis use V = 10 or 20.
#  cv_sl = CV.SuperLearner(Y = Y_train, X = X_train, family = binomial(), V = 3,
#                          SL.library = c("SL.mean", "SL.glmnet", learners$names, "SL.randomForest"))
#  
#  # Review results.
#  summary(cv_sl)

## ----multicore-cvsl, eval=F----------------------------------------------
#  # Setup parallel computation - use all cores on our computer.
#  num_cores = RhpcBLASctl::get_num_cores()
#  
#  # How many cores does this computer have?
#  num_cores
#  
#  # Use 2 of those cores for parallel SuperLearner.
#  # Replace "2" with "num_cores" (without quotes) to use all cores.
#  options(mc.cores = 2)
#  
#  # Check how many parallel workers we are using (on macOS/Linux).
#  getOption("mc.cores")
#  
#  # We need to set a different type of seed that works across cores.
#  # Otherwise the other cores will go rogue and we won't get repeatable results.
#  # This version is for the "multicore" parallel system in R.
#  set.seed(1, "L'Ecuyer-CMRG")
#  
#  # While this is running check CPU using in Activity Monitor / Task Manager.
#  system.time({
#    cv_sl = CV.SuperLearner(Y = Y_train, X = X_train, family = binomial(), V = 10,
#                            parallel = "multicore",
#                            SL.library = c("SL.mean", "SL.glmnet", learners$names, "SL.randomForest"))
#  })
#  
#  # Review results.
#  summary(cv_sl)

## ----snow-cvsl, eval=F---------------------------------------------------
#  # Make a snow cluster
#  # Again, replace 2 with num_cores to use all available cores.
#  cluster = parallel::makeCluster(2)
#  
#  # Check the cluster object.
#  cluster
#  
#  # Load the SuperLearner package on all workers so they can find
#  # SuperLearner::All(), the default screening function which keeps all variables.
#  parallel::clusterEvalQ(cluster, library(SuperLearner))
#  
#  # We need to explictly export our custom learner functions to the workers.
#  parallel::clusterExport(cluster, learners$names)
#  
#  # We need to set a different type of seed that works across cores.
#  # This version is for SNOW parallelization.
#  # Otherwise the other cores will go rogue and we won't get repeatable results.
#  parallel::clusterSetRNGStream(cluster, 1)
#  
#  # While this is running check CPU using in Activity Monitor / Task Manager.
#  system.time({
#    cv_sl = CV.SuperLearner(Y = Y_train, X = X_train, family = binomial(), V = 10,
#                            parallel = cluster,
#                            SL.library = c("SL.mean", "SL.glmnet", learners$names, "SL.randomForest"))
#  })
#  
#  # Review results.
#  summary(cv_sl)
#  
#  # Stop the cluster workers now that we're done.
#  parallel::stopCluster(cluster)

## ----mcSuperLearner, eval=F----------------------------------------------
#  # Set multicore compatible seed.
#  set.seed(1, "L'Ecuyer-CMRG")
#  
#  # Fit the SuperLearner.
#  sl = mcSuperLearner(Y = Y_train, X = X_train, family = binomial(),
#                      SL.library = c("SL.mean", "SL.glmnet", learners$names, "SL.randomForest"))
#  sl
#  
#  # We see the time is reduced over our initial single-core superlearner.
#  sl$times$everything

## ----snowSuperLearner, eval=F--------------------------------------------
#  # Make a snow cluster
#  # Reminder: change "2" to "num_cores" (without quotes) to use all available cores.
#  cluster = parallel::makeCluster(2)
#  
#  # Check the cluster object.
#  cluster
#  
#  # Load the SuperLearner package on all workers so they can find
#  # SuperLearner::All(), the default screening function which keeps all variables.
#  parallel::clusterEvalQ(cluster, library(SuperLearner))
#  
#  # We need to explictly export our custom learner functions to the workers.
#  parallel::clusterExport(cluster, learners$names)
#  
#  # We need to set a different type of seed that works across cores.
#  # This version is for SNOW parallelization.
#  # Otherwise the other cores will go rogue and we won't get repeatable results.
#  parallel::clusterSetRNGStream(cluster, 1)
#  
#  # Fit the SuperLearner.
#  sl = snowSuperLearner(Y = Y_train, X = X_train, family = binomial(),
#                        cluster = cluster,
#                        SL.library = c("SL.mean", "SL.glmnet", learners$names, "SL.randomForest"))
#  sl
#  
#  # We see the time is reduced over our initial single-core superlearner.
#  sl$times$everything

## ----review-weights, eval=F----------------------------------------------
#  # Review meta-weights (coefficients) from a CV.SuperLearner object
#  review_weights = function(cv_sl) {
#    meta_weights = coef(cv_sl)
#    means = colMeans(meta_weights)
#    sds = apply(meta_weights, MARGIN = 2,  FUN = sd)
#    mins = apply(meta_weights, MARGIN = 2, FUN = min)
#    maxs = apply(meta_weights, MARGIN = 2, FUN = max)
#    # Combine the stats into a single matrix.
#    sl_stats = cbind("mean(weight)" = means, "sd" = sds, "min" = mins, "max" = maxs)
#    # Sort by decreasing mean weight.
#    sl_stats[order(sl_stats[, 1], decreasing = T), ]
#  }
#  
#  print(review_weights(cv_sl), digits = 3)

## ----feature-selection, eval=F-------------------------------------------
#  listWrappers()
#  
#  # Review code for corP, which is based on univariate correlation.
#  screen.corP
#  
#  set.seed(1)
#  
#  # Fit the SuperLearner.
#  # We need to use list() instead of c().
#  # We use V = 3 to save computation time; for a real analysis use V = 10 or 20.
#  cv_sl = CV.SuperLearner(Y = Y_train, X = X_train, family = binomial(), V = 3,
#                          parallel = "multicore",
#                          SL.library = list("SL.mean", "SL.glmnet", c("SL.glmnet", "screen.corP")))
#  summary(cv_sl)

## ----auc, cache=F, eval=F------------------------------------------------
#  set.seed(1)
#  
#  # We use V = 3 to save computation time; for a real analysis use V = 10 or 20.
#  cv_sl = CV.SuperLearner(Y = Y_train, X = X_train, family = binomial(), V = 3,
#                          method = "method.AUC",
#                          SL.library = list("SL.mean", "SL.glmnet", c("SL.glmnet", "screen.corP")))
#  summary(cv_sl)
#  

## ----xgboost, cache=F, eval=F--------------------------------------------
#  # 3 * 4 * 3 = 36 different configurations.
#  tune = list(ntrees = c(100, 200, 500),
#              max_depth = 1:4,
#              shrinkage = c(0.001, 0.01, 0.1))
#  
#  # Set detailed names = T so we can see the configuration for each function.
#  # Also shorten the name prefix.
#  learners = create.Learner("SL.xgboost", tune = tune, detailed_names = T, name_prefix = "xgb")
#  
#  # 36 configurations - not too shabby.
#  length(learners$names)
#  learners$names
#  
#  # Confirm we have multiple cores configured. This should be > 1.
#  getOption("mc.cores")
#  
#  # Remember to set multicore-compatible seed.
#  set.seed(1, "L'Ecuyer-CMRG")
#  
#  # Fit the CV.SuperLearner. This will take 1-2 minutes.
#  # We use V = 3 to save computation time; for a real analysis use V = 10 or 20.
#  system.time({
#    cv_sl = CV.SuperLearner(Y = Y_train, X = X_train, family = binomial(),
#                            V = 3, parallel = "multicore",
#                            SL.library = c("SL.mean", "SL.glmnet", learners$names, "SL.randomForest"))
#  })
#  
#  # Review results.
#  summary(cv_sl)
#  review_weights(cv_sl)

## ----xgb-plot, fig.width=5, fig.height=8, eval=F-------------------------
#  plot(cv_sl) + theme_bw()

