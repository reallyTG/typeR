library(poptrend)


### Name: change
### Title: Compute the change in the population over a time interval.
### Aliases: change

### ** Examples

## Simulate a data set with 10 sites and 30 years
data = simTrend(30, 10)
## Fit a smooth trend with fixed site effects, random time effects,
## and automatic selection of degrees of freedom
trFit = ptrend(count ~ trend(year, type = "smooth") + site, data = data)
## Check the estimated percent change from year 2 to 20
change(trFit, 10, 20)



