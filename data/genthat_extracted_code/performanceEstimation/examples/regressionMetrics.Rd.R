library(performanceEstimation)


### Name: regressionMetrics
### Title: Calculate some standard regression evaluation metrics of
###   predictive performance
### Aliases: regressionMetrics
### Keywords: models

### ** Examples

## Not run: 
##D ## Calculating several statistics of a regression tree on the Swiss data
##D data(swiss)
##D idx <- sample(1:nrow(swiss),as.integer(0.7*nrow(swiss)))
##D train <- swiss[idx,]
##D test <- swiss[-idx,]
##D library(rpart)
##D model <- rpart(Infant.Mortality ~ .,train)
##D preds <- predict(model,test)
##D ## by default only mse is calculated
##D regressionMetrics(test[,'Infant.Mortality'],preds)
##D ## calculate mae and rmse
##D regressionMetrics(test[,'Infant.Mortality'],preds,metrics=c('mae','rmse'))
##D ## calculate all statistics
##D regressionMetrics(test[,'Infant.Mortality'],preds,train.y=train[,'Infant.Mortality'])
## End(Not run)



