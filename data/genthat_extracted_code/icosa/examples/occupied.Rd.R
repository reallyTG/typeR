library(icosa)


### Name: occupied
### Title: Faces occupied by the specified object
### Aliases: occupied

### ** Examples

# create a grid
g <- trigrid(8, sp=TRUE)
# create random points
randPoints <- rpsphere(100,output="polar")
# the facelayer occupied by these points
randomLayer <- occupied(g, randPoints)
plot(randomLayer)
points(randPoints, col="blue", pch="+")





