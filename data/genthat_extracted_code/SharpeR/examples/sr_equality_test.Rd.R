library(SharpeR)


### Name: sr_equality_test
### Title: Paired test for equality of Sharpe ratio
### Aliases: sr_equality_test
### Keywords: htest

### ** Examples

# under the null 
rv <- sr_equality_test(matrix(rnorm(500*5),ncol=5))
# under the alternative (but with identity covariance)
ope <- 253
nyr <- 10
nco <- 5
rets <- 0.01 * sapply(seq(0,1.7/sqrt(ope),length.out=nco),
  function(mu) { rnorm(ope*nyr,mean=mu,sd=1) })
rv <- sr_equality_test(rets)

## Not run: 
##D # using real data
##D if (require(quantmod)) {
##D   get.ret <- function(sym,...) {
##D     OHLCV <- getSymbols(sym,auto.assign=FALSE,...)
##D     lrets <- diff(log(OHLCV[,paste(c(sym,"Adjusted"),collapse=".",sep="")]))
##D     lrets[-1,]
##D   }
##D   get.rets <- function(syms,...) { some.rets <- do.call("cbind",lapply(syms,get.ret,...)) }
##D   some.rets <- get.rets(c("IBM","AAPL","NFLX","SPY"))
##D   pvs <- sr_equality_test(some.rets)
##D }
##D # test for uniformity
##D pvs <- replicate(1024,{ x <- sr_equality_test(matrix(rnorm(400*5),400,5),type="chisq")
##D                        x$p.value })
##D plot(ecdf(pvs))
##D abline(0,1,col='red') 
## End(Not run)
## Not run: 
##D if (require(sandwich)) {
##D   set.seed(as.integer(charToRaw("0b2fd4e9-3bdf-4e3e-9c75-25c6d18c331f")))
##D   n.manifest <- 10
##D   n.latent <- 4
##D   n.day <- 1024
##D   snr <- 0.95
##D   latent.rets <- matrix(rnorm(n.day*n.latent),ncol=n.latent) %*%
##D 	matrix(runif(n.latent*n.manifest),ncol=n.manifest)
##D   noise.rets <- matrix(rnorm(n.day*n.manifest),ncol=n.manifest)
##D   some.rets <- snr * latent.rets + sqrt(1-snr^2) * noise.rets
##D   # naive vcov
##D   pvs0 <- sr_equality_test(some.rets)
##D   # HAC vcov
##D   pvs1 <- sr_equality_test(some.rets,vcov.func=vcovHAC)
##D   # more elaborately:
##D   pvs <- sr_equality_test(some.rets,vcov.func=function(amod) {
##D 	vcovHAC(amod,prewhite=TRUE) })
##D }
## End(Not run)




