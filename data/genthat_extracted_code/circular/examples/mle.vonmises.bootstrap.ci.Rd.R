library(circular)


### Name: mle.vonmises.bootstrap.ci
### Title: Bootstrap Confidence Intervals
### Aliases: mle.vonmises.bootstrap.ci print.mle.vonmises.bootstrap.ci
### Keywords: htest

### ** Examples

x <- rvonmises(n=25, mu=circular(0), kappa=3)
x.bs <- mle.vonmises.bootstrap.ci(x, alpha=.10)
par(mfcol=c(1,2))
rose.diag(x.bs$mu, bins=30, main=expression(mu))
hist(x.bs$kappa, main=expression(kappa))



