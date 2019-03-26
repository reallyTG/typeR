library(HyperbolicDist)


### Name: resistors
### Title: Resistance of One-half-ohm Resistors
### Aliases: resistors
### Keywords: datasets

### ** Examples

data(resistors)
str(resistors)
attach(resistors)
### Construct data from frequency summary, taking all observations
### at midpoints of intervals
resistances <- rep(midpoints,counts)
hist(resistances)
logHist(resistances)
## Fit the hyperbolic distribution
hyperbFit(resistances) 

## Actually fit.hyperb can deal with frequency data
hyperbFit(midpoints, freq=counts)




