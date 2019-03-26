library(caret)


### Name: train
### Title: Fit Predictive Models over Different Tuning Parameters
### Aliases: train train.default train.formula train.recipe
### Keywords: models

### ** Examples


## Not run: 
##D 
##D #######################################
##D ## Classification Example
##D 
##D data(iris)
##D TrainData <- iris[,1:4]
##D TrainClasses <- iris[,5]
##D 
##D knnFit1 <- train(TrainData, TrainClasses,
##D                  method = "knn",
##D                  preProcess = c("center", "scale"),
##D                  tuneLength = 10,
##D                  trControl = trainControl(method = "cv"))
##D 
##D knnFit2 <- train(TrainData, TrainClasses,
##D                  method = "knn",
##D                  preProcess = c("center", "scale"),
##D                  tuneLength = 10,
##D                  trControl = trainControl(method = "boot"))
##D 
##D 
##D library(MASS)
##D nnetFit <- train(TrainData, TrainClasses,
##D                  method = "nnet",
##D                  preProcess = "range",
##D                  tuneLength = 2,
##D                  trace = FALSE,
##D                  maxit = 100)
##D 
##D #######################################
##D ## Regression Example
##D 
##D library(mlbench)
##D data(BostonHousing)
##D 
##D lmFit <- train(medv ~ . + rm:lstat,
##D                data = BostonHousing,
##D                method = "lm")
##D 
##D library(rpart)
##D rpartFit <- train(medv ~ .,
##D                   data = BostonHousing,
##D                   method = "rpart",
##D                   tuneLength = 9)
##D 
##D #######################################
##D ## Example with a custom metric
##D 
##D madSummary <- function (data,
##D                         lev = NULL,
##D                         model = NULL) {
##D   out <- mad(data$obs - data$pred,
##D              na.rm = TRUE)
##D   names(out) <- "MAD"
##D   out
##D }
##D 
##D robustControl <- trainControl(summaryFunction = madSummary)
##D marsGrid <- expand.grid(degree = 1, nprune = (1:10) * 2)
##D 
##D earthFit <- train(medv ~ .,
##D                   data = BostonHousing,
##D                   method = "earth",
##D                   tuneGrid = marsGrid,
##D                   metric = "MAD",
##D                   maximize = FALSE,
##D                   trControl = robustControl)
##D 
##D 
##D #######################################
##D ## Example with a recipe
##D 
##D data(cox2)
##D 
##D cox2 <- cox2Descr
##D cox2$potency <- cox2IC50
##D 
##D library(recipes)
##D 
##D cox2_recipe <- recipe(potency ~ ., data = cox2) %>%
##D   ## Log the outcome
##D   step_log(potency, base = 10) %>%
##D   ## Remove sparse and unbalanced predictors
##D   step_nzv(all_predictors()) %>%
##D   ## Surface area predictors are highly correlated so
##D   ## conduct PCA just on these.
##D   step_pca(contains("VSA"), prefix = "surf_area_",
##D            threshold = .95) %>%
##D   ## Remove other highly correlated predictors
##D   step_corr(all_predictors(), -starts_with("surf_area_"),
##D             threshold = .90) %>%
##D   ## Center and scale all of the non-PCA predictors
##D   step_center(all_predictors(), -starts_with("surf_area_")) %>%
##D   step_scale(all_predictors(), -starts_with("surf_area_"))
##D 
##D set.seed(888)
##D cox2_lm <- train(cox2_recipe,
##D                  data = cox2,
##D                  method = "lm",
##D                  trControl = trainControl(method = "cv"))
##D 
##D #######################################
##D ## Parallel Processing Example via multicore package
##D 
##D ## library(doMC)
##D ## registerDoMC(2)
##D 
##D ## NOTE: don't run models form RWeka when using
##D ### multicore. The session will crash.
##D 
##D ## The code for train() does not change:
##D set.seed(1)
##D usingMC <-  train(medv ~ .,
##D                   data = BostonHousing,
##D                   method = "glmboost")
##D 
##D ## or use:
##D ## library(doMPI) or
##D ## library(doParallel) or
##D ## library(doSMP) and so on
##D 
## End(Not run)





