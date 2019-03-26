library(voteogram)


### Name: house_carto
### Title: Produce a ProPublica- or GovTrack-style House roll call vote
###   cartogram
### Aliases: house_carto

### ** Examples

## Not run: 
##D # what you'd normally do
##D rep <- roll_call("house", 115, 1, 256)
## End(Not run)

# using a saved object
rep <- readRDS(system.file("extdata", "rep.rds", package="voteogram"))

house_carto(rep, pp_square=TRUE)



