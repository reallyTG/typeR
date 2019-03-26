library(spsann)


### Name: optimCORR
### Title: Optimization of sample configurations for spatial trend
###   identification and estimation (I)
### Aliases: optimCORR objCORR CORR objCORR
### Keywords: iteration optimize spatial

### ** Examples

data(meuse.grid, package = "sp")
candi <- meuse.grid[1:1000, 1:2]
covars <- meuse.grid[1:1000, 5]
schedule <- scheduleSPSANN(
  initial.temperature = 5, chains = 1, x.max = 1540, y.max = 2060, 
  x.min = 0, y.min = 0, cellsize = 40)
set.seed(2001)
res <- optimCORR(
  points = 10, candi = candi, covars = covars, use.coords = TRUE, 
  schedule = schedule)
objSPSANN(res) - objCORR(
  points = res, candi = candi, covars = covars, use.coords = TRUE)



