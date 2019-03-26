library(complmrob)


### Name: complmrob
### Title: MM-type estimators for linear regression on compositional data
### Aliases: complmrob

### ** Examples

data <- data.frame(lifeExp = state.x77[, "Life Exp"], USArrests[ , -3])
mUSArr <- complmrob(lifeExp ~ ., data = data)
summary(mUSArr)



