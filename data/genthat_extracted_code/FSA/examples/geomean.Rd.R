library(FSA)


### Name: geomean
### Title: Calculates the geometric mean or geometric standard deviation.
### Aliases: geomean geosd
### Keywords: misc

### ** Examples

## generate random lognormal data
d <- rlnorm(500,meanlog=0,sdlog=1)
# d has a mean on log scale of 0; thus, gm should be exp(0)~=1
# d has a sd on log scale of 1; thus, gsd should be exp(1)~=2.7
geomean(d)
geosd(d)

## Not run: 
##D ## Demonstrate handling of zeros and negative values
##D x <- seq(-1,5)
##D # this will given an error
##D geomean(x)
##D # this will only give a warning, but might not be what you want
##D geomean(x,zneg.rm=TRUE)
## End(Not run)




