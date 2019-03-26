library(superml)


### Name: XGBTrainer
### Title: Extreme Gradient Boosting Trainer
### Aliases: XGBTrainer
### Keywords: datasets

### ** Examples

library(data.table)
df <- copy(iris)

# convert characters/factors to numeric
df$Species <- as.numeric(as.factor(df$Species))-1

# initialise model
xgb <- XGBTrainer$new(objective = 'multi:softmax',
                      maximize = FALSE,
                      eval_metric = 'merror',
                      num_class=3,
                      n_estimators = 2)
xgb$fit(df, 'Species')

# do cross validation to find optimal value for n_estimators
xgb$cross_val(X = df, y = 'Species',nfolds = 3, stratified = TRUE,
              early_stopping = 1)
best_iter <- xgb$cv_model$best_iteration
xgb$show_importance()

# make predictions
preds <- xgb$predict(as.matrix(iris[,1:4]))
preds



