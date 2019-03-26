library(costat)


### Name: mergexy
### Title: Concatenate a set of solution results into one set
### Aliases: mergexy
### Keywords: ts

### ** Examples

#
# Generate two dummy time series
#
x1 <- rnorm(32)
y1 <- rnorm(32)
#
# Run two optimizations 
#
## Not run: solnset1 <- findstysols(Nsims=1, tsx=x1, tsy=y1)
## Not run: solnset2 <- findstysols(Nsims=1, tsx=x1, tsy=y1)
#
# Merge them
#
## Not run: solnset <- mergexy(solnset1, solnset2)



