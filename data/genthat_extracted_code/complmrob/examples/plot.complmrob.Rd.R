library(complmrob)


### Name: plot.complmrob
### Title: Diagnostic plots for the robust regression model with
###   compositional covariats
### Aliases: plot.complmrob

### ** Examples

data <- data.frame(lifeExp = state.x77[, "Life Exp"], USArrests[ , -3])
mUSArr <- complmrob(lifeExp ~ ., data = data)
plot(mUSArr)
plot(mUSArr, type = "model") # for the model diagnostic plots



