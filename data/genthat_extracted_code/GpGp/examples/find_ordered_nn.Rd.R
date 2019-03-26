library(GpGp)


### Name: find_ordered_nn
### Title: Find ordered nearest neighbors.
### Aliases: find_ordered_nn

### ** Examples

locs <- as.matrix( expand.grid( (1:40)/40, (1:40)/40 ) )     # grid of locations
ord <- order_maxmin(locs)                                     # calculate an ordering
locsord <- locs[ord,]                                        # reorder locations
m <- 20
NNarray <- find_ordered_nn(locsord,20)             # find ordered nearest 20 neighbors
ind <- 100
# plot all locations in gray, first ind locations in black,
# ind location with magenta circle, m neighhbors with blue circle
plot( locs[,1], locs[,2], pch = 16, col = "gray" )
points( locsord[1:ind,1], locsord[1:ind,2], pch = 16 )
points( locsord[ind,1], locsord[ind,2], col = "magenta", cex = 1.5 )
points( locsord[NNarray[ind,2:(m+1)],1], locsord[NNarray[ind,2:(m+1)],2], col = "blue", cex = 1.5 )



