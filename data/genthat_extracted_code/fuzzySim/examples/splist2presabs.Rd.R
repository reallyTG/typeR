library(fuzzySim)


### Name: splist2presabs
### Title: Convert a species list to a presence-absence table
### Aliases: splist2presabs
### Keywords: manip

### ** Examples

data(rotifers)

head(rotifers)

rotifers.presabs <- splist2presabs(rotifers, sites.col = "TDWG4",
sp.col = "species", keep.n = FALSE)

head(rotifers.presabs)



