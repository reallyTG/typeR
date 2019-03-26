library(surveillance)


### Name: multiplicity.Spatial
### Title: Count Number of Instances of Points
### Aliases: multiplicity.Spatial
### Keywords: utilities spatial

### ** Examples

foo <- SpatialPoints(matrix(c(1,2,
                              2,3,
                              1,2,
                              4,5), 4, 2, byrow=TRUE))
multiplicity(foo)

# the following function determines the multiplicities in a matrix
# or data frame and returns unique rows with appended multiplicity
countunique <- function(x) unique(cbind(x, count=multiplicity(x)))
countunique(coordinates(foo))



