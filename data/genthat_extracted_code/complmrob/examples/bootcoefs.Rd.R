library(complmrob)


### Name: bootcoefs
### Title: Bootstrap the regression coefficients for a robust linear
###   regression model
### Aliases: bootcoefs bootcoefs.complmrob bootcoefs.lmrob

### ** Examples

data <- data.frame(lifeExp = state.x77[, "Life Exp"], USArrests[ , -3])
mUSArr <- complmrob(lifeExp ~ ., data = data)
bc <- bootcoefs(mUSArr, R = 200) # the number of bootstrap replicates should
                                 # normally be higher!
summary(bc)
plot(bc) # for the model diagnostic plots



