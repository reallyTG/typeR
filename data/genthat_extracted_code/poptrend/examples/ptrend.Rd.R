library(poptrend)


### Name: ptrend
### Title: Fit a smooth or linear trend to count survey data.
### Aliases: ptrend

### ** Examples

## Simulate a data set with 15 sites and 25 years
data = simTrend(15, 25)
## Fit a smooth trend with fixed site effects, random time effects,
## and automatic selection of degrees of freedom
trFit = ptrend(count ~ trend(year, tempRE = TRUE, type = "smooth") + site, data = data)
## Check the model fit
checkFit(trFit)
## Plot the trend
plot(trFit)
summary(trFit)
## Check the estimated percent change from year 8 to 25
change(trFit, 8, 25)

## Fit a loglinear trend model with random site effects and random time effects 
## to the same data set.
trLin = ptrend(count ~ trend(year, tempRE = TRUE, type = "loglinear") +
                 s(site, bs = "re"), data = data)
plot(trLin)
summary(trLin)

## Fit an index model with fixed site effects and an (unrelated) continous covariate 
## as a smooth effect.
# Simulate mock covariate unrelated to data.
cov = rnorm(nrow(data))
trInd = ptrend(count ~ trend(year, type = "index") + site + s(cov), data = data)
plot(trInd)
summary(trInd)



