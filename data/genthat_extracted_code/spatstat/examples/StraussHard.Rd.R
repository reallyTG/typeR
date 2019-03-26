library(spatstat)


### Name: StraussHard
### Title: The Strauss / Hard Core Point Process Model
### Aliases: StraussHard
### Keywords: spatial models

### ** Examples

   StraussHard(r=1,hc=0.02)
   # prints a sensible description of itself

   data(cells)

   ## Not run: 
##D    ppm(cells, ~1, StraussHard(r=0.1, hc=0.05))
##D    # fit the stationary Strauss/hard core  process to `cells'
##D    
## End(Not run)

   ppm(cells, ~ polynom(x,y,3), StraussHard(r=0.1, hc=0.05))
   # fit a nonstationary Strauss/hard core process
   # with log-cubic polynomial trend



