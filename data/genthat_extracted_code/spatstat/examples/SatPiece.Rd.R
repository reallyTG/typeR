library(spatstat)


### Name: SatPiece
### Title: Piecewise Constant Saturated Pairwise Interaction Point Process
###   Model
### Aliases: SatPiece
### Keywords: spatial models

### ** Examples

   SatPiece(c(0.1,0.2), c(1,1))
   # prints a sensible description of itself
   SatPiece(c(0.1,0.2), 1)
   data(cells) 
   ppm(cells, ~1, SatPiece(c(0.07, 0.1, 0.13), 2))
   # fit a stationary piecewise constant Saturated pairwise interaction process

   ## Not run: 
##D    ppm(cells, ~polynom(x,y,3), SatPiece(c(0.07, 0.1, 0.13), 2))
##D    # nonstationary process with log-cubic polynomial trend
##D    
## End(Not run)



