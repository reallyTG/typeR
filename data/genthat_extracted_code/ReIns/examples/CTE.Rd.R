library(ReIns)


### Name: CTE
### Title: Conditional Tail Expectation
### Aliases: CTE ES

### ** Examples

## Not run: 
##D 
##D # Pareto random sample
##D X <- rpareto(1000, shape = 2)
##D 
##D # Splice ME and Pareto
##D splicefit <- SpliceFitPareto(X, 0.6)
##D 
##D p <- seq(0.01, 0.99, 0.01)
##D # Plot of CTE
##D plot(p, CTE(p, splicefit), type="l", xlab="p", ylab=bquote(CTE[1-p]))
## End(Not run)



