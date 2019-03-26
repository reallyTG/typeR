library(DMwR)


### Name: regr.eval
### Title: Calculate Some Standard Regression Evaluation Statistics
### Aliases: regr.eval
### Keywords: models

### ** Examples

## Calculating several statistics of a regression tree on the Swiss data
data(swiss)
idx <- sample(1:nrow(swiss),as.integer(0.7*nrow(swiss)))
train <- swiss[idx,]
test <- swiss[-idx,]
library(rpart)
model <- rpart(Infant.Mortality ~ .,train)
preds <- predict(model,test)
## calculate mae and rmse
regr.eval(test[,'Infant.Mortality'],preds,stats=c('mae','rmse'))
## calculate all statistics
regr.eval(test[,'Infant.Mortality'],preds,train.y=train[,'Infant.Mortality'])




