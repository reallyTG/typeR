library(GeneralizedHyperbolic)


### Name: resistors
### Title: Resistance of One-half-ohm Resistors
### Aliases: resistors
### Keywords: datasets

### ** Examples

data(resistors)
str(resistors)
### Construct data from frequency summary, taking all observations
### at midpoints of intervals
resistances <- rep(resistors$midpoints, resistors$counts)
hist(resistances)
DistributionUtils::logHist(resistances)
## Fit the hyperbolic distribution
hyperbFit(resistances)

## Actually fit.hyperb can deal with frequency data
hyperbFit(resistors$midpoints, freq = resistors$counts)



