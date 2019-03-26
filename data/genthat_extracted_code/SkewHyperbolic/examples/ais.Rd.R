library(SkewHyperbolic)


### Name: ais
### Title: Australian Institute of Sport data
### Aliases: ais
### Keywords: datasets

### ** Examples

data(ais)
Fe <- ais$Fe
### Not enough data to find starting values
### Use default parameter values as starting values
FeFit <- skewhypFit(Fe, startValues = "US", paramStart = c(0,1,1,1))
### Ferritin must always be non-negative
### Probability of negative values is small for fitted distribution
pskewhyp(0, param = FeFit$param)



