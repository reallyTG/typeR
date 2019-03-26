library(SharpeR)


### Name: as.del_sropt
### Title: Compute the Sharpe ratio of a hedged Markowitz portfolio.
### Aliases: as.del_sropt as.del_sropt.default as.del_sropt.xts
### Keywords: univar

### ** Examples

nfac <- 5
nyr <- 10
ope <- 253
# simulations with no covariance structure.
# under the null:
set.seed(as.integer(charToRaw("be determinstic")))
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0,sd=0.0125),ncol=nfac)
# hedge out the first one:
G <- matrix(diag(nfac)[1,],nrow=1)
asro <- as.del_sropt(Returns,G,drag=0,ope=ope)
print(asro)
G <- diag(nfac)[c(1:3),]
asro <- as.del_sropt(Returns,G,drag=0,ope=ope)
# compare to sropt on the remaining assets
# they should be close, but not exact.
asro.alt <- as.sropt(Returns[,4:nfac],drag=0,ope=ope)
## Not run: 
##D # using real data.
##D if (require(quantmod)) {
##D   get.ret <- function(sym,...) {
##D     OHLCV <- getSymbols(sym,auto.assign=FALSE,...)
##D     lrets <- diff(log(OHLCV[,paste(c(sym,"Adjusted"),collapse=".",sep="")]))
##D     # chomp first NA!
##D     lrets[-1,]
##D   }
##D   get.rets <- function(syms,...) { 
##D 	some.rets <- do.call("cbind",lapply(syms,get.ret,...)) 
##D  }
##D   some.rets <- get.rets(c("IBM","AAPL","A","C","SPY","XOM"))
##D   # hedge out SPY
##D   G <- diag(dim(some.rets)[2])[5,]
##D   asro <- as.del_sropt(some.rets,G)
##D }
## End(Not run)



