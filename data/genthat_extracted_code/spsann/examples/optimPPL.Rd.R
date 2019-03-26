library(spsann)


### Name: optimPPL
### Title: Optimization of sample configurations for variogram
###   identification and estimation
### Aliases: optimPPL countPPL objPPL PPL objPPL countPPL
### Keywords: iteration optimize spatial

### ** Examples

## Not run: 
##D # This example takes more than 5 seconds
##D require(sp)
##D data(meuse.grid)
##D candi <- meuse.grid[, 1:2]
##D schedule <- scheduleSPSANN(chains = 1, initial.temperature = 30,
##D                            x.max = 1540, y.max = 2060, x.min = 0, 
##D                            y.min = 0, cellsize = 40)
##D set.seed(2001)
##D res <- optimPPL(points = 10, candi = candi, schedule = schedule)
##D objSPSANN(res) - objPPL(points = res, candi = candi)
##D countPPL(points = res, candi = candi)
## End(Not run)



