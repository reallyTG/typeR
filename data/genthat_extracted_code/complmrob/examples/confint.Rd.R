library(complmrob)


### Name: confint.bccomplmrob
### Title: Calculate confidence intervals
### Aliases: confint.bccomplmrob confint.bclmrob

### ** Examples

data <- data.frame(lifeExp = state.x77[, "Life Exp"], USArrests[ , -3])
mUSArr <- complmrob(lifeExp ~ ., data = data)
bc <- bootcoefs(mUSArr, R = 200) # the number of bootstrap replicates should
                                 # normally be higher!
confint(bc, level = 0.95, type = "perc")

### For normal robust linear regression models ###
require(robustbase)
data(aircraft)

mod <- lmrob(Y ~ ., data = aircraft)
bootEst <- bootcoefs(mod, R = 200)
confint(bootEst, level = 0.95, type = "perc")



