library(spatstat)


### Name: Triplets
### Title: The Triplet Point Process Model
### Aliases: Triplets
### Keywords: spatial models

### ** Examples

   Triplets(r=0.1)
   # prints a sensible description of itself

   ## Not run: 
##D    ppm(cells, ~1, Triplets(r=0.2))
##D    # fit the stationary Triplets process to `cells'
##D    
## End(Not run)

   ppm(cells, ~polynom(x,y,3), Triplets(r=0.2))
   # fit a nonstationary Triplets process with log-cubic polynomial trend



