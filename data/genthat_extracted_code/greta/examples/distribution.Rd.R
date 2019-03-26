library(greta)


### Name: distribution
### Title: define a distribution over data
### Aliases: distribution distribution<-

### ** Examples

## Not run: 
##D 
##D # define a model likelihood
##D 
##D # observed data and mean parameter to be estimated
##D # (explicitly coerce data to a greta array so we can refer to it later)
##D y <- as_data(rnorm(5, 0, 3))
##D 
##D mu <- uniform(-3, 3)
##D 
##D # define the distribution over y (the model likelihood)
##D distribution(y) <- normal(mu, 1)
##D 
##D # get the distribution over y
##D distribution(y)
## End(Not run)



