library(complmrob)


### Name: plot.bootcoefs
### Title: Plot the distribution of the bootstrap estimates
### Aliases: plot.bootcoefs

### ** Examples

data <- data.frame(lifeExp = state.x77[, "Life Exp"], USArrests[ , -3])
mUSArr <- complmrob(lifeExp ~ ., data = data)
bc <- bootcoefs(mUSArr, R = 200) # this can take some time
plot(bc) # for the model diagnostic plots



