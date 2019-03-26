library(simsem)


### Name: getPopulation
### Title: Extract the data generation population model underlying a result
###   object
### Aliases: getPopulation

### ** Examples

## Not run: 
##D loading <- matrix(0, 6, 1)
##D loading[1:6, 1] <- NA
##D LY <- bind(loading, "runif(1, 0.4, 0.9)")
##D RPS <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")
##D 
##D # We will use only 10 replications to save time.
##D # In reality, more replications are needed.
##D Output <- sim(10, n=200, model=CFA.Model)
##D 
##D # Get the population parameters
##D getPopulation(Output)
## End(Not run)



