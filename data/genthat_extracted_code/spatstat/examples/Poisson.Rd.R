library(spatstat)


### Name: Poisson
### Title: Poisson Point Process Model
### Aliases: Poisson
### Keywords: spatial models

### ** Examples

 ppm(nztrees ~1, Poisson())
 # fit the stationary Poisson process to 'nztrees'
 # no edge correction needed

 lon <- longleaf
 ## Don't show: 
   lon <- lon[seq(1, npoints(lon), by=50)]
 
## End(Don't show)
 longadult <- unmark(subset(lon, marks >= 30))
 ppm(longadult ~ x, Poisson())
 # fit the nonstationary Poisson process 
 # with intensity lambda(x,y) = exp( a + bx)

 # trees marked by species
 lans <- lansing
 ## Don't show: 
     lans <- lans[seq(1, npoints(lans), by=30)]
 
## End(Don't show)
 ppm(lans ~ marks, Poisson())
 # fit stationary marked Poisson process
 # with different intensity for each species

## Not run: 
##D  ppm(lansing ~ marks * polynom(x,y,3), Poisson())
## End(Not run)
 # fit nonstationary marked Poisson process
 # with different log-cubic trend for each species
## Don't show: 
   # equivalent functionality - smaller dataset
   ppm(amacrine ~ marks * polynom(x,y,2), Poisson())
## End(Don't show)



