library(simsem)


### Name: getExtraOutput
### Title: Get extra outputs from the result of simulation
### Aliases: getExtraOutput

### ** Examples

## Not run: 
##D loading <- matrix(0, 6, 1)
##D loading[1:6, 1] <- NA
##D LY <- bind(loading, 0.7)
##D RPS <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")
##D 
##D # Write a function to extract the modification index from lavaan object
##D outfun <- function(out) {
##D 	result <- inspect(out, "mi")
##D }
##D 
##D # We will use only 5 replications to save time.
##D # In reality, more replications are needed.
##D Output <- sim(5, n=200, model=CFA.Model, outfun=outfun)
##D 
##D # Get the modification index of each replication
##D getExtraOutput(Output)
## End(Not run)



