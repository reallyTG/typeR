library(PopGenReport)


### Name: wassermann
### Title: Partial Mantel tests on costdistance matrices
### Aliases: wassermann

### ** Examples


## No test: 
library(raster)
fric.raster <- readRDS(system.file("extdata","fric.raster.rdata", package="PopGenReport"))
glc <- genleastcost(landgen, fric.raster, "D", NN=8)
wassermann(eucl.mat = glc$eucl.mat, cost.mats = glc$cost.mats, gen.mat = glc$gen.mat)
## End(No test)



