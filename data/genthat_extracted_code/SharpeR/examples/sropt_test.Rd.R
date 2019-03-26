library(SharpeR)


### Name: sropt_test
### Title: test for optimal Sharpe ratio
### Aliases: sropt_test
### Keywords: htest

### ** Examples


# test for uniformity
pvs <- replicate(128,{ x <- sropt_test(matrix(rnorm(1000*4),ncol=4),alternative="two.sided")
                        x$p.value })
plot(ecdf(pvs))
abline(0,1,col='red') 

# input a sropt objects:
nfac <- 5
nyr <- 10
ope <- 253
# simulations with no covariance structure.
# under the null:
set.seed(as.integer(charToRaw("be determinstic")))
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0,sd=0.0125),ncol=nfac)
asro <- as.sropt(Returns,drag=0,ope=ope)
stest <- sropt_test(asro,alternative="two.sided")




