library(spatstat)


### Name: Concom
### Title: The Connected Component Process Model
### Aliases: Concom
### Keywords: spatial models

### ** Examples

   # prints a sensible description of itself
   Concom(r=0.1)

   # Fit the stationary connected component process to redwood data
   ppm(redwood, ~1, Concom(r=0.07), rbord=0.07)

   # Fit the stationary connected component process to `cells' data
   ppm(cells, ~1, Concom(r=0.06), rbord=0.06)
   # eta=0 indicates hard core process.

   # Fit a nonstationary connected component model
   # with log-cubic polynomial trend
   ## Not run: 
##D    ppm(swedishpines, ~polynom(x/10,y/10,3), Concom(r=7), rbord=7)
##D    
## End(Not run)



