library(lulcc)


### Name: NeighbRasterStack
### Title: Create a NeighbRasterStack object
### Aliases: NeighbRasterStack
###   NeighbRasterStack,RasterLayer,list,ANY-method
###   NeighbRasterStack,RasterLayer,matrix,ANY-method
###   NeighbRasterStack,RasterLayer,ANY,NeighbRasterStack-method

### ** Examples


## Plum Island Ecosystems

## observed data
obs <- ObsLulcRasterStack(x=pie,
                    pattern="lu",
                    categories=c(1,2,3),
                    labels=c("forest","built","other"),
                    t=c(0,6,14))

## create a NeighbRasterStack object for 1985 land use map
w1 <- matrix(data=1, nrow=3, ncol=3, byrow=TRUE)
w2 <- w1
w3 <- w1

nb1 <- NeighbRasterStack(x=obs[[1]],
                 categories=c(1,2,3),
                 weights=list(w1,w2,w3))

## update nb2 for 1991
nb2 <- NeighbRasterStack(x=obs[[2]],
                  neighb=nb1)

## plot neighbourhood map for forest
plot(nb2[[1]])




