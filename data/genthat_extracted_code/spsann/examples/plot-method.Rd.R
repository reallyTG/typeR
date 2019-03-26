library(spsann)


### Name: plot.OptimizedSampleConfiguration
### Title: Plot an optimized sample configuration
### Aliases: plot.OptimizedSampleConfiguration plot

### ** Examples

require(sp)
data(meuse.grid)
candi <- meuse.grid[, 1:2]
covars <- meuse.grid[, 5]
schedule <- scheduleSPSANN(initial.temperature = 5, chains = 1,
                           x.max = 1540, y.max = 2060, x.min = 0, 
                           y.min = 0, cellsize = 40)
set.seed(2001)
res <- optimCORR(points = 10, candi = candi, covars = covars, 
                 use.coords = TRUE, schedule = schedule)
plot(res)



