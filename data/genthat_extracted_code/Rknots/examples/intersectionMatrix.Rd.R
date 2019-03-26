library(Rknots)


### Name: intersectionMatrix
### Title: Compute the intersection matrix of a polygonal link
### Aliases: intersectionMatrix
### Keywords: utilities

### ** Examples

##Compute the intersection matrix of a random structure of 20 points
points <- matrix(runif(60,-1,1), ncol = 3)

intersectionMatrix(points)

##Compute the intersection matrix of the trefoil knot
data(Rolfsen.table, package = "Rknots")
trefoil <- Rolfsen.table$"3.1"

intersectionMatrix(trefoil)



