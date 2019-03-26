library(ReIns)


### Name: VaR
### Title: VaR of splicing fit
### Aliases: VaR

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
##D p <- seq(0,1,0.01)
##D 
##D # Plot of quantiles
##D plot(p, qSplice(p, splicefit), type="l", xlab="p", ylab="Q(p)")
##D 
##D # Plot of VaR
##D plot(p, VaR(p, splicefit), type="l", xlab="p", ylab=bquote(VaR[1-p]))
## End(Not run)



