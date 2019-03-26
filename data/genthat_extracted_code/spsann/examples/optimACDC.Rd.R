library(spsann)


### Name: optimACDC
### Title: Optimization of sample configurations for spatial trend
###   identification and estimation (III)
### Aliases: optimACDC objACDC ACDC objACDC
### Keywords: iteration optimize spatial

### ** Examples

data(meuse.grid, package = "sp")
candi <- meuse.grid[1:1000, 1:2]
nadir <- list(sim = 10, seeds = 1:10)
utopia <- list(user = list(DIST = 0, CORR = 0))
covars <- meuse.grid[1:1000, 5]
schedule <- scheduleSPSANN(
  chains = 1, initial.temperature = 5, x.max = 1540, y.max = 2060, 
  x.min = 0, y.min = 0, cellsize = 40)
set.seed(2001)
res <- optimACDC(
  points = 10, candi = candi, covars = covars, nadir = nadir,
  use.coords = TRUE, utopia = utopia, schedule = schedule)
objSPSANN(res) - objACDC(
  points = res, candi = candi, covars = covars, 
  use.coords = TRUE, nadir = nadir, utopia = utopia)



