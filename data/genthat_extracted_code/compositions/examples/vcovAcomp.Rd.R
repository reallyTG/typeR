library(compositions)


### Name: vcovAcomp
### Title: Variance covariance matrix of parameters in compositional
###   regression
### Aliases: vcovAcomp
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
model <- lm(ilr(sa.groups)~sa.groups.area)
vcovAcomp(model)[,,1,1]



