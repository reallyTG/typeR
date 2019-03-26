library(spatstat)


### Name: PairPiece
### Title: The Piecewise Constant Pairwise Interaction Point Process Model
### Aliases: PairPiece
### Keywords: spatial models

### ** Examples

   PairPiece(c(0.1,0.2))
   # prints a sensible description of itself
   data(cells) 

   ## Not run: 
##D    ppm(cells, ~1, PairPiece(r = c(0.05, 0.1, 0.2)))
##D    # fit a stationary piecewise constant pairwise interaction process
##D    
## End(Not run)

   ppm(cells, ~polynom(x,y,3), PairPiece(c(0.05, 0.1)))
   # nonstationary process with log-cubic polynomial trend



