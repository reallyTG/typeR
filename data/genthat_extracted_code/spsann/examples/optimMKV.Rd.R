library(spsann)


### Name: optimMKV
### Title: Optimization of sample configurations for spatial interpolation
###   (II)
### Aliases: optimMKV objMKV MKV objMKV
### Keywords: iteration optimize spatial

### ** Examples

## Not run: 
##D data(meuse.grid, package = "sp")
##D candi <- meuse.grid[1:1000, 1:2]
##D covars <- as.data.frame(meuse.grid)[1:1000, ]
##D vgm <- gstat::vgm(psill = 10, model = "Exp", range = 500, nugget = 8)
##D schedule <- scheduleSPSANN(
##D   initial.temperature = 10, chains = 1, x.max = 1540, y.max = 2060, 
##D   x.min = 0,  y.min = 0, cellsize = 40)
##D set.seed(2001)
##D res <- optimMKV(
##D   points = 10, candi = candi, covars = covars, eqn = z ~ dist, 
##D   vgm = vgm, schedule = schedule)
##D objSPSANN(res) - objMKV(
##D   points = res, candi = candi, covars = covars,  eqn = z ~ dist, 
##D   vgm = vgm)
## End(Not run)



