library(RobExtremes)


### Name: PickandsEstimator
### Title: Function to compute Pickands estimates for the GPD and GEVD
### Aliases: PickandsEstimator .PickandsEstimator
### Keywords: univar

### ** Examples

## (empirical) Data
set.seed(123)
x <- rgpd(50, scale = 0.5, shape = 3)
y <- rgev(50, scale = 0.5, shape = 3)
## parametric family of probability measures
P <- GParetoFamily(scale = 1, shape = 2)
G <- GEVFamily(scale = 1, shape = 2)
##
PickandsEstimator(x = x, ParamFamily = P)
PickandsEstimator(x = y, ParamFamily = G)



