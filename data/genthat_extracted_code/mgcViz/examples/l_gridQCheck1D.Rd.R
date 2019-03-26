library(mgcViz)


### Name: l_gridQCheck1D
### Title: Checking sign of residuals along one covariate
### Aliases: l_gridQCheck1D

### ** Examples

# Simulate some data
library(mgcViz)
set.seed(3841)
dat <- gamSim(1,n=400,dist="normal",scale=2)
dat$fac <- as.factor( sample(letters[1:8], nrow(dat), replace = TRUE) ) 
fit <- qgamV(y~s(x1)+s(x2)+s(x3)+fac, data=dat, err = 0.05, qu = 0.4)

# "x0" effect is missing, but should be there. l_gridQCheck1D shows
# that fraction of negative residuals is quite different from the theoretical 0.4
# in several places along "x0".
check1D(fit, dat$x0) + l_gridQCheck1D(qu = 0.4, n = 20)
# The problem gets better if s(x0) is added to the model.

## Not run: 
##D # Works also with factor variables
##D check1D(fit, "fac") + l_gridQCheck1D(qu = 0.4)
## End(Not run)



