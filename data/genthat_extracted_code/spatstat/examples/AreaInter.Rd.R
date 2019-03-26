library(spatstat)


### Name: AreaInter
### Title: The Area Interaction Point Process Model
### Aliases: AreaInter
### Keywords: spatial models

### ** Examples

   ## Don't show: 
op <- spatstat.options(ngrid.disc=8)
## End(Don't show)

   # prints a sensible description of itself
   AreaInter(r=0.1)

   # Note the reach is twice the radius
   reach(AreaInter(r=1))

   # Fit the stationary area interaction process to Swedish Pines data
   data(swedishpines)
   ppm(swedishpines, ~1, AreaInter(r=7))

   # Fit the stationary area interaction process to `cells'
   data(cells) 
   ppm(cells, ~1, AreaInter(r=0.06))
   # eta=0 indicates hard core process.

   # Fit a nonstationary area interaction with log-cubic polynomial trend
   ## Not run: 
##D    ppm(swedishpines, ~polynom(x/10,y/10,3), AreaInter(r=7))
##D    
## End(Not run)
   ## Don't show: 
spatstat.options(op)
## End(Don't show)



