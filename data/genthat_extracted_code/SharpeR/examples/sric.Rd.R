library(SharpeR)


### Name: sric
### Title: Sharpe Ratio Information Coefficient
### Aliases: sric

### ** Examples

# generate some sropts
nfac <- 3
nyr <- 5
ope <- 253
# simulations with no covariance structure.
# under the null:
set.seed(as.integer(charToRaw("fix seed")))
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0,sd=0.0125),ncol=nfac)
asro <- as.sropt(Returns,drag=0,ope=ope)
srv <- sric(asro)




