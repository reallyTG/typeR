library(PopGenReport)


### Name: lgrMMRR
### Title: Multiple Matrix Regression with Randomization analysis
### Aliases: lgrMMRR

### ** Examples


## No test: 
data(landgen)
library(raster)
fric.raster <- readRDS(system.file("extdata","fric.raster.rdata", package="PopGenReport"))
glc <- genleastcost(landgen, fric.raster, "D", NN=4, path="leastcost")
lgrMMRR(glc$gen.mat, glc$cost.mats, glc$eucl.mat, nperm=999)
## End(No test)



