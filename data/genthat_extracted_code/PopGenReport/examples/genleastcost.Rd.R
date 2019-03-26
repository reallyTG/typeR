library(PopGenReport)


### Name: genleastcost
### Title: Least-cost path analysis based on a friction matrix
### Aliases: genleastcost

### ** Examples


## No test: 
library(raster)
fric.raster <- readRDS(system.file("extdata","fric.raster.rdata", package="PopGenReport"))
glc <- genleastcost(cats=landgen, fric.raster, "D", NN=8)
wassermann(eucl.mat = glc$eucl.mat, cost.mat = glc$cost.mats, gen.mat = glc$gen.mat)
lgrMMRR(gen.mat = glc$gen.mat, cost.mats = glc$cost.mats, eucl.mat = glc$eucl.mat)
## End(No test)



