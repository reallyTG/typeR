library(spsann)


### Name: optimSPAN
### Title: Optimization of sample configurations for variogram and spatial
###   trend identification and estimation, and for spatial interpolation
### Aliases: optimSPAN objSPAN SPAN objSPAN
### Keywords: iteration optimize spatial

### ** Examples

## Not run: 
##D # This example takes more than 5 seconds to run!
##D require(sp)
##D data(meuse.grid)
##D candi <- meuse.grid[, 1:2]
##D nadir <- list(sim = 10, seeds = 1:10)
##D utopia <- list(user = list(DIST = 0, CORR = 0, PPL = 0, MSSD = 0))
##D covars <- meuse.grid[, 5]
##D schedule <- scheduleSPSANN(chains = 1, initial.temperature = 1,
##D                            x.max = 1540, y.max = 2060, x.min = 0, 
##D                            y.min = 0, cellsize = 40)
##D set.seed(2001)
##D res <- optimSPAN(points = 10, candi = candi, covars = covars, nadir = nadir,
##D                  use.coords = TRUE, utopia = utopia, schedule = schedule)
##D objSPSANN(res) -
##D   objSPAN(points = res, candi = candi, covars = covars, nadir = nadir,
##D           use.coords = TRUE, utopia = utopia)
## End(Not run)



