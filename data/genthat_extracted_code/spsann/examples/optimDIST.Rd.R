library(spsann)


### Name: optimDIST
### Title: Optimization of sample configurations for spatial trend
###   identification and estimation (II)
### Aliases: optimDIST objDIST DIST objDIST
### Keywords: iteration optimize spatial

### ** Examples

require(sp)
data(meuse.grid)
candi <- meuse.grid[, 1:2]
covars <- meuse.grid[, 5]
schedule <- scheduleSPSANN(initial.temperature = 1, chains = 1,
                           x.max = 1540, y.max = 2060, x.min = 0, 
                           y.min = 0, cellsize = 40)
set.seed(2001)
res <- optimDIST(points = 10, candi = candi, covars = covars,
                 use.coords = TRUE, schedule = schedule)
objSPSANN(res) -
  objDIST(points = res, candi = candi, covars = covars, use.coords = TRUE)



