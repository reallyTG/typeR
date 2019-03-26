library(kazaam)


### Name: glms
### Title: Generalized Linear Model Fitters
### Aliases: glms reg.fit logistic.fit poisson.fit

### ** Examples

## Not run: 
##D library(kazaam)
##D comm.set.seed(1234, diff=TRUE)
##D 
##D x = ranshaq(rnorm, 10, 3)
##D y = ranshaq(function(i) sample(0:1, size=i, replace=TRUE), 10)
##D 
##D fit = logistic.fit(x, y)
##D comm.print(fit)
##D 
##D finalize()
## End(Not run)




