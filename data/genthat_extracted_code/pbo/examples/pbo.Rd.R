library(pbo)


### Name: pbo
### Title: Probability of backtest overfitting
### Aliases: pbo
### Keywords: CSCV PBO backtest overfitting probability

### ** Examples

## Not run: 
##D require(pbo)
##D require(PerformanceAnalytics)
##D n <- 100
##D t <- 1000
##D s <- 8
##D m <- data.frame(matrix(rnorm(n*t,mean=0,sd=1),
##D   nrow=t,ncol=n,byrow=TRUE,
##D   dimnames=list(1:t,1:n)),
##D   check.names=FALSE)
##D p <- pbo(m,s,f=Omega,threshold=1)
## End(Not run)



