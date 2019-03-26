library(gsg)


### Name: moments.differentials
### Title: Calculates selection differentials directly from the differences
###   in phenotypic moments before and after selection.
### Aliases: moments.differentials

### ** Examples

# simulated data (stabilizing selection)
z<-rnorm(200,0,2)
W<-rpois(200,exp(1-0.3*z^2))
d<-as.data.frame(list(W=W,z=z))

# estimate selection coefficients by least-squares regression
moments.differentials(z=z,W=W)
# note that standardized differentials and gradients are trivially
# the same in a univariate analysis



