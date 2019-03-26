library(PopGenReport)


### Name: landgenreport
### Title: Create a landscape genetic report
### Aliases: landgenreport

### ** Examples


## No test: 
library(raster)
fric.raster <- readRDS(system.file("extdata","fric.raster.rdata", package="PopGenReport"))
lc<-landgenreport(cats=landgen, fric.raster=fric.raster, gen.distance="D", NN=4, mk.resistance=TRUE)
names(lc$leastcost)
## End(No test)



