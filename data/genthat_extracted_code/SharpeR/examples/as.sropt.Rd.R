library(SharpeR)


### Name: as.sropt
### Title: Compute the Sharpe ratio of the Markowitz portfolio.
### Aliases: as.sropt as.sropt.default as.sropt.xts
### Keywords: univar

### ** Examples

nfac <- 5
nyr <- 10
ope <- 253
# simulations with no covariance structure.
# under the null:
set.seed(as.integer(charToRaw("be determinstic")))
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0,sd=0.0125),ncol=nfac)
asro <- as.sropt(Returns,drag=0,ope=ope)
# under the alternative:
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0.0005,sd=0.0125),ncol=nfac)
asro <- as.sropt(Returns,drag=0,ope=ope)
# generating correlated multivariate normal data in a more sane way
if (require(MASS)) {
  nstok <- 10
  nfac <- 3
  nyr <- 10
  ope <- 253
  X.like <- 0.01 * matrix(rnorm(500*nfac),ncol=nfac) %*% 
    matrix(runif(nfac*nstok),ncol=nstok)
  Sigma <- cov(X.like) + diag(0.003,nstok)
  # under the null:
  Returns <- mvrnorm(ceiling(ope*nyr),mu=matrix(0,ncol=nstok),Sigma=Sigma)
  asro <- as.sropt(Returns,ope=ope)
  # under the alternative
  Returns <- mvrnorm(ceiling(ope*nyr),mu=matrix(0.001,ncol=nstok),Sigma=Sigma)
  asro <- as.sropt(Returns,ope=ope)
}
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
##D   asro <- as.sropt(some.rets)
##D }
## End(Not run)



