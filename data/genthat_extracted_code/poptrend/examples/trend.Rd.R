library(poptrend)


### Name: trend
### Title: Define a trend component.
### Aliases: trend

### ** Examples

## Simulate a data set with 15 sites and 25 years
data = simTrend(15, 25)
## Fit a smooth trend with fixed site effects, but no random time effects,
## and fixed degrees of freedom
trFit = ptrend(count ~ trend(year, tempRE = FALSE, k =  8, fx = FALSE, type = "smooth") +
                 site, data = data)
plot(trFit)



