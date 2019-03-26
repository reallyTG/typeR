library(glmnetcr)


### Name: predict.glmnetcr
### Title: AIC, BIC, Predicted Class, and Fitted Probabilities for All
###   Models
### Aliases: predict.glmnetcr
### Keywords: methods

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
glmnet.fit <- glmnetcr(x, y)
result <- predict(glmnet.fit)
names(result)



