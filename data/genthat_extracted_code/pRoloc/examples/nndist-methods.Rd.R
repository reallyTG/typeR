library(pRoloc)


### Name: nndist-methods
### Title: Nearest neighbour distances
### Aliases: nndist-methods nndist,matrix,matrix-method
###   nndist,matrix,missing-method nndist,MSnSet,missing-method nndist
### Keywords: methods

### ** Examples

library("pRolocdata")
data(dunkley2006)

## Using a matrix as input
m <- exprs(dunkley2006)
m[1:4, 1:3]
head(nndist(m, k = 5))
tail(nndist(m[1:100, ], k = 2, dist = "mahalanobis"))

## Same as above for MSnSet
d <- nndist(dunkley2006, k = 5)
head(fData(d))

d <- nndist(dunkley2006[1:100, ], k = 2, dist = "mahalanobis")
tail(fData(d))

## Using a query
nndist(m[1:100, ], m[101:110, ], k = 2)



