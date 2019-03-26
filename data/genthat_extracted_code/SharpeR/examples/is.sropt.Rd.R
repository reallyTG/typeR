library(SharpeR)


### Name: is.sropt
### Title: Is this in the "sropt" class?
### Aliases: is.sropt

### ** Examples

nfac <- 5
nyr <- 10
ope <- 253
# simulations with no covariance structure.
# under the null:
set.seed(as.integer(charToRaw("be determinstic")))
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0,sd=0.0125),ncol=nfac)
asro <- as.sropt(Returns,drag=0,ope=ope)
is.sropt(asro)



