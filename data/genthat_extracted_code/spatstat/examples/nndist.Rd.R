library(spatstat)


### Name: nndist
### Title: Nearest neighbour distances
### Aliases: nndist nndist.ppp nndist.default
### Keywords: spatial math

### ** Examples

   data(cells)
   # nearest neighbours
   d <- nndist(cells)

   # second nearest neighbours
   d2 <- nndist(cells, k=2)

   # first, second and third nearest
   d1to3 <- nndist(cells, k=1:3)

   x <- runif(100)
   y <- runif(100)
   d <- nndist(x, y)

   # Stienen diagram
   plot(cells %mark% (nndist(cells)/2), markscale=1)

   # distance to nearest neighbour of each type
   nnda <- nndist(ants, by=marks(ants)) 
   head(nnda)
   # For nest number 1, the nearest Cataglyphis nest is 87.32125 units away

   # Use of 'aggregate':
   # minimum distance between each pair of types
   aggregate(nnda, by=list(from=marks(ants)), min)
   # Always a symmetric matrix

   # mean nearest neighbour distances
   aggregate(nnda, by=list(from=marks(ants)), mean)
   # The mean distance from a Messor nest to
   # the nearest Cataglyphis nest is 59.02549 units



