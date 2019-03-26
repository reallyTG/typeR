library(spsann)


### Name: optimCLHS
### Title: Optimization of sample configurations for spatial trend
###   identification and estimation (IV)
### Aliases: optimCLHS objCLHS CLHS objCLHS
### Keywords: iteration optimize spatial

### ** Examples

data(meuse.grid, package = "sp")
candi <- meuse.grid[1:1000, 1:2]
covars <- meuse.grid[1:1000, 5]
weights <- list(O1 = 0.5, O3 = 0.5)
schedule <- scheduleSPSANN(
  chains = 1, initial.temperature = 20, x.max = 1540, y.max = 2060, 
  x.min = 0, y.min = 0, cellsize = 40)
set.seed(2001)
res <- optimCLHS(
  points = 10, candi = candi, covars = covars, use.coords = TRUE, 
  weights = weights, schedule = schedule)
objSPSANN(res) - objCLHS(
  points = res, candi = candi, covars = covars, use.coords = TRUE, 
  weights = weights)



