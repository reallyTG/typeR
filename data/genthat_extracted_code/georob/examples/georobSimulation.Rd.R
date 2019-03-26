library(georob)


### Name: georobSimulation
### Title: Simulating Realizations of Gaussian Processes from Object of
###   Class 'georob'
### Aliases: georobSimulation condsim control.condsim
### Keywords: models spatial robust

### ** Examples

## Not run: 
##D   
##D data(meuse)
##D data(meuse.grid)
##D 
##D ## convert to SpatialGridDataFrame
##D meuse.grid.sgdf <- meuse.grid
##D coordinates(meuse.grid.sgdf) <- ~ x + y
##D gridded(meuse.grid.sgdf) <- TRUE
##D fullgrid(meuse.grid.sgdf) <- TRUE
##D 
##D ## Gaussian REML fit
##D r.logzn.reml <- georob(log(zinc) ~ sqrt(dist), data = meuse, locations = ~ x + y,
##D     variogram.model = "RMexp",
##D     param = c(variance = 0.15, nugget = 0.05, scale = 200),
##D     tuning.psi = 1000)
##D     
##D ## Conditional simulations
##D r.sim <- condsim(r.logzn.reml, newdata = meuse.grid.sgdf, nsim = 100, seed = 1)
##D str(r.sim, max=2)
##D 
##D ## Display
##D spplot(r.sim, zcol = "sim.1", at = seq(3.5, 8.5, by = 0.5))
##D spplot(r.sim, zcol = "sim.2", at = seq(3.5, 8.5, by = 0.5))
##D 
##D library(lattice)
##D levelplot(sim.1 ~ x + y, as.data.frame(r.sim), aspect = "iso", at = seq(3.5, 8.5, by = 0.5),
##D   panel = function(x, y, z, subscripts, data.points, ... ){
##D     panel.levelplot( x, y, z, subscripts, ...)
##D     panel.xyplot(data.points$x, data.points$y, col = 1)
##D   }, data.points = meuse[, c("x", "y")]
##D )
##D levelplot(sim.2 ~ x + y, as.data.frame(r.sim), aspect = "iso", at = seq(3.5, 8.5, by = 0.5),
##D   panel = function(x, y, z, subscripts, data.points, ... ){
##D     panel.levelplot( x, y, z, subscripts, ...)
##D     panel.xyplot(data.points$x, data.points$y, col = 1)
##D   }, data.points = meuse[, c("x", "y")]
##D )
##D 
## End(Not run)



