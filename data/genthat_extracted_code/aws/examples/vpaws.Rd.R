library(aws)


### Name: vpaws
### Title: vector valued version of function 'paws' with homogeneous
###   covariance structure
### Aliases: vpaws vpawscov
### Keywords: smooth nonparametric regression

### ** Examples

## Not run: 
##D setCores(2)
##D y <- array(rnorm(4*64^3),c(4,64,64,64))
##D yhat <- vpaws(y,kstar=20)
## End(Not run)



