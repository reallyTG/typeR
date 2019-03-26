library(voteogram)


### Name: senate_carto
### Title: Produce a Senate cartogram
### Aliases: senate_carto

### ** Examples

## Not run: 
##D # what you'd normally do
##D sen <- roll_call("senate", 115, 1, 110)
## End(Not run)

# Using a saved object
sen <- readRDS(system.file("extdata", "sen.rds", package="voteogram"))

senate_carto(sen)



