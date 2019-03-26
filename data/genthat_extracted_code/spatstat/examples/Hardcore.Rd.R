library(spatstat)


### Name: Hardcore
### Title: The Hard Core Point Process Model
### Aliases: Hardcore
### Keywords: spatial models

### ** Examples

   Hardcore(0.02)
   # prints a sensible description of itself

   ## Not run: 
##D    ppm(cells, ~1, Hardcore(0.05))
##D    # fit the stationary hard core process to `cells'
##D    
## End(Not run)

   # estimate hard core radius from data
   ppm(cells, ~1, Hardcore())
   ppm(cells, ~1, Hardcore)

   ppm(cells, ~ polynom(x,y,3), Hardcore(0.05))
   # fit a nonstationary hard core process
   # with log-cubic polynomial trend



