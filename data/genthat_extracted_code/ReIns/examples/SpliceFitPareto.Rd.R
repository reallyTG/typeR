library(ReIns)


### Name: SpliceFitPareto
### Title: Splicing of mixed Erlang and Pareto
### Aliases: SpliceFitPareto SpliceFitHill

### ** Examples

## Not run: 
##D 
##D # Pareto random sample
##D X <- rpareto(1000, shape = 2)
##D 
##D # Splice ME and Pareto
##D splicefit <- SpliceFitPareto(X, 0.6)
##D 
##D 
##D 
##D x <- seq(0, 20, 0.01)
##D 
##D # Plot of spliced CDF
##D plot(x, pSplice(x, splicefit), type="l", xlab="x", ylab="F(x)")
##D 
##D # Plot of spliced PDF
##D plot(x, dSplice(x, splicefit), type="l", xlab="x", ylab="f(x)")
##D 
##D 
##D 
##D # Fitted survival function and empirical survival function 
##D SpliceECDF(x, X, splicefit)
##D 
##D # Log-log plot with empirical survival function and fitted survival function
##D SpliceLL(x, X, splicefit)
##D 
##D # PP-plot of empirical survival function and fitted survival function
##D SplicePP(X, splicefit)
##D 
##D # PP-plot of empirical survival function and 
##D # fitted survival function with log-scales
##D SplicePP(X, splicefit, log=TRUE)
##D 
##D # Splicing QQ-plot
##D SpliceQQ(X, splicefit)
## End(Not run)



