library(PopGenReport)


### Name: opt.landgen
### Title: Function for optimising a landscape genetic analysis based on
###   resistance layers
### Aliases: opt.landgen

### ** Examples

## No test: 
library(raster)
fric.raster <- readRDS(system.file("extdata","fric.raster.rdata", package="PopGenReport"))
opt.landgen(landscape = fric.raster, nlocations = 5, mindist = 3, 
method = "leastcost", NN = 8, iter = 10)
## End(No test)



