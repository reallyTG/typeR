library(spsann)


### Name: optimMSSD
### Title: Optimization of sample configurations for spatial interpolation
###   (I)
### Aliases: optimMSSD objMSSD MSSD objMSSD
### Keywords: iteration optimize spatial

### ** Examples

require(sp)
data(meuse.grid)
candi <- meuse.grid[, 1:2]
schedule <- scheduleSPSANN(chains = 1, initial.temperature = 5000000,
                           x.max = 1540, y.max = 2060, x.min = 0, 
                           y.min = 0, cellsize = 40)
set.seed(2001)
res <- optimMSSD(points = 10, candi = candi, schedule = schedule)
objSPSANN(res) - objMSSD(candi = candi, points = res)




