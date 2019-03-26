library(ReIns)


### Name: ExcessSplice
### Title: Estimates for excess-loss premiums using splicing
### Aliases: ExcessSplice

### ** Examples

## Not run: 
##D 
##D # Pareto random sample
##D X <- rpareto(1000, shape = 2)
##D 
##D # Splice ME and Pareto
##D splicefit <- SpliceFitPareto(X, 0.8)
##D 
##D # Excess-loss premium 
##D ExcessSplice(R=2, splicefit=splicefit)
## End(Not run)



