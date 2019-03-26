library(spatstat)


### Name: DiggleGatesStibbard
### Title: Diggle-Gates-Stibbard Point Process Model
### Aliases: DiggleGatesStibbard
### Keywords: spatial models

### ** Examples

   DiggleGatesStibbard(0.02)
   # prints a sensible description of itself

   ## Not run: 
##D    ppm(cells ~1, DiggleGatesStibbard(0.05))
##D    # fit the stationary D-G-S process to `cells'
##D    
## End(Not run)

   ppm(cells ~ polynom(x,y,3), DiggleGatesStibbard(0.05))
   # fit a nonstationary D-G-S process
   # with log-cubic polynomial trend



