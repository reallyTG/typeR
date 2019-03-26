library(spatstat)


### Name: Strauss
### Title: The Strauss Point Process Model
### Aliases: Strauss
### Keywords: spatial models

### ** Examples

   Strauss(r=0.1)
   # prints a sensible description of itself
   data(cells)

   ## Not run: 
##D    ppm(cells, ~1, Strauss(r=0.07))
##D    # fit the stationary Strauss process to `cells'
##D    
## End(Not run)


   ppm(cells, ~polynom(x,y,3), Strauss(r=0.07))
   # fit a nonstationary Strauss process with log-cubic polynomial trend



