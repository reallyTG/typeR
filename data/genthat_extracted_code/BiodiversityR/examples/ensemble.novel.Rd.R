library(BiodiversityR)


### Name: ensemble.novel
### Title: Mapping of novel environmental conditions (areas where some of
###   the environmental conditions are outside the range of environmental
###   conditions of a reference area).
### Aliases: ensemble.novel ensemble.novel.object

### ** Examples


## Not run: 
##D # get predictor variables
##D library(dismo)
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D predictors <- subset(predictors, subset=c("bio1", "bio5", "bio6", "bio7", "bio8", 
##D     "bio12", "bio16", "bio17"))
##D predictors
##D predictors@title <- "base"
##D 
##D # reference area to calculate environmental ranges
##D ext <- extent(-70, -50, -10, 10)
##D extent.values2 <- c(-70, -50, -10, 10)
##D predictors.current <- crop(predictors, y=ext)
##D predictors.current <- stack(predictors.current)
##D 
##D novel.test <- ensemble.novel.object(predictors.current, name="noveltest")
##D novel.test
##D novel.raster <- ensemble.novel(x=predictors, novel.object=novel.test, KML.out=T)
##D novel.raster
##D 
##D plot(novel.raster)
##D # no novel conditions within reference area
##D rect(extent.values2[1], extent.values2[3], extent.values2[2], extent.values2[4])
##D 
##D # use novel conditions as a simple species suitability mapping method
##D # presence points
##D presence_file <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
##D pres <- read.table(presence_file, header=TRUE, sep=',')[,-1]
##D pres.data <- data.frame(extract(predictors, y=pres))
##D 
##D # ranges and maps
##D Bradypus.ranges1 <- ensemble.novel.object(pres.data, name="Bradypus", quantiles=F)
##D Bradypus.ranges1
##D Bradypus.novel1 <- ensemble.novel(x=predictors, novel.object=Bradypus.ranges1, KML.out=T)
##D Bradypus.novel1
##D 
##D par.old <- graphics::par(no.readonly=T)
##D graphics::par(mfrow=c(1,2))
##D 
##D # suitable where there are no novel conditions
##D raster::plot(Bradypus.novel1, breaks=c(-0.1, 0, 1), col=c("green", "grey"), 
##D     main="Suitability mapping using minimum to maximum range")
##D points(pres[, 2] ~ pres[, 1], pch=1, col="red", cex=0.8)
##D 
##D # use 90 percent intervals similar to BIOCLIM methodology
##D Bradypus.ranges2 <- ensemble.novel.object(pres.data, name="BradypusQuantiles", quantiles=T)
##D Bradypus.ranges2
##D Bradypus.novel2 <- ensemble.novel(x=predictors, novel.object=Bradypus.ranges2, KML.out=T)
##D Bradypus.novel2
##D raster::plot(Bradypus.novel2, breaks=c(-0.1, 0, 1), col=c("green", "grey"), 
##D     main="Suitability mapping using quantile range")
##D points(pres[, 2] ~ pres[, 1], pch=1, col="red", cex=0.8)
##D 
##D graphics::par(par.old)
##D 
##D # deal with novel factor levels through dummy variables
##D predictors <- stack(predictor.files)
##D biome.layer <- predictors[["biome"]]
##D biome.layer
##D ensemble.dummy.variables(xcat=biome.layer, most.frequent=0, freq.min=1,
##D     overwrite=TRUE)
##D 
##D predictors.dummy <- stack(predictor.files)
##D predictors.dummy <- subset(predictors.dummy, subset=c("biome_1", "biome_2",  "biome_3",  
##D     "biome_4", "biome_5", "biome_7",  "biome_8",  "biome_9", 
##D     "biome_10", "biome_12", "biome_13", "biome_14"))
##D predictors.dummy
##D predictors.dummy@title <- "base_dummy"
##D 
##D predictors.dummy.current <- crop(predictors.dummy, y=ext)
##D predictors.dummy.current <- stack(predictors.dummy.current)
##D 
##D novel.levels <- ensemble.novel.object(predictors.dummy.current, name="novellevels")
##D novel.levels
##D novel.levels.raster <- ensemble.novel(x=predictors.dummy, novel.object=novel.levels, 
##D     KML.out=T)
##D novel.levels.raster
##D 
##D novel.levels.quantiles <- ensemble.novel.object(predictors.dummy.current, quantiles=TRUE,
##D     name="novellevels_quantiles")
##D novel.levels.quantiles
##D novel.levels.quantiles.raster <- ensemble.novel(x=predictors.dummy, 
##D     novel.object=novel.levels.quantiles, KML.out=T)
##D novel.levels.quantiles.raster
##D 
##D # difference in ranges for variables with low frequencies
##D background <- dismo::randomPoints(predictors.dummy.current, n=10000, p=NULL, excludep=F)
##D extract.data <- extract(predictors.dummy.current, y=background)
##D colSums(extract.data)/sum(extract.data)*100
##D novel.levels
##D novel.levels.quantiles
##D 
##D par.old <- graphics::par(no.readonly=T)
##D graphics::par(mfrow=c(1,2))
##D raster::plot(novel.levels.raster, breaks=c(-0.1, 0, 1), col=c("grey", "green"), 
##D     main="novel outside minimum to maximum range")
##D rect(extent.values2[1], extent.values2[3], extent.values2[2], extent.values2[4])
##D raster::plot(novel.levels.quantiles.raster, breaks=c(-0.1, 0, 1), col=c("grey", "green"), 
##D     main="novel outside quantile range")
##D rect(extent.values2[1], extent.values2[3], extent.values2[2], extent.values2[4])
##D graphics::par(par.old)
##D 
## End(Not run)



