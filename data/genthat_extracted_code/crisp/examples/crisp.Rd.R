library(crisp)


### Name: crisp
### Title: Convex Regression with Interpretable Sharp Partitions (CRISP).
### Aliases: crisp

### ** Examples

## Not run: 
##D #See ?'crisp-package' for a full example of how to use this package
##D 
##D #generate data (using a very small 'n' for illustration purposes)
##D set.seed(1)
##D data <- sim.data(n = 15, scenario = 2)
##D 
##D #fit model for a range of tuning parameters, i.e., lambda values
##D #lambda sequence is chosen automatically if not specified
##D crisp.out <- crisp(X = data$X, y = data$y)
## End(Not run)



