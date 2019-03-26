library(DAKS)


### Name: pop_variance
### Title: Population Asymptotic Variance
### Aliases: pop_variance
### Keywords: htest math models multivariate univar utilities

### ** Examples

## Not run: 
##D x <- simu(5, 100, 0.05, 0.05, delta = 0.15)
##D y <- pop_iita(x$implications, 0.05, 0.05, 5, x$dataset, v = 2)
##D pop_variance(y$pop.matrix, 
##D              y$selection.set[[which(y$pop.diff == min(y$pop.diff))]],
##D              y$error.pop[which(y$pop.diff == min(y$pop.diff))], v = 2)
## End(Not run)



