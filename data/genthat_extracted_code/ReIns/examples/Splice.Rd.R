library(ReIns)


### Name: Splice
### Title: Spliced distribution
### Aliases: dSplice pSplice qSplice rSplice
### Keywords: distribution

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
##D p <- seq(0, 1, 0.01)
##D 
##D # Plot of splicing quantiles
##D plot(p, qSplice(p, splicefit), type="l", xlab="p", ylab="Q(p)")
##D 
##D # Plot of VaR
##D plot(p, VaR(p, splicefit), type="l", xlab="p", ylab=bquote(VaR[p]))
##D 
##D 
##D 
##D # Random sample from spliced distribution
##D x <- rSplice(1000, splicefit)
##D 
## End(Not run)



