library(BiodiversityR)


### Name: ensemble.bioclim
### Title: Suitability mapping based on the BIOCLIM algorithm
### Aliases: ensemble.bioclim ensemble.bioclim.object

### ** Examples


## Not run: 
##D # get predictor variables
##D library(dismo)
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D # subset based on Variance Inflation Factors
##D predictors <- subset(predictors, subset=c("bio5", "bio6", 
##D     "bio16", "bio17", "biome"))
##D predictors
##D predictors@title <- "base"
##D 
##D # presence points
##D presence_file <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
##D pres <- read.table(presence_file, header=TRUE, sep=',')[,-1]
##D 
##D background <- dismo::randomPoints(predictors, n=100)
##D colnames(background)=c('lon', 'lat')
##D 
##D pres.dataset <- data.frame(extract(predictors, y=pres))
##D names(pres.dataset) <- names(predictors)
##D pres.dataset$biome <- as.factor(pres.dataset$biome)
##D 
##D Bradypus.bioclim <- ensemble.bioclim.object(predictors, quantiles=T, 
##D     p=pres, factors="biome", species.name="Bradypus")
##D Bradypus.bioclim
##D # obtain the same results with a data.frame
##D Bradypus.bioclim2 <- ensemble.bioclim.object(pres.dataset, quantiles=T, 
##D     species.name="Bradypus")
##D Bradypus.bioclim2
##D # obtain results for entire rasterStack
##D Bradypus.bioclim3 <- ensemble.bioclim.object(predictors, p=NULL, quantiles=T, 
##D     factors="biome", species.name="America")
##D Bradypus.bioclim3
##D 
##D ensemble.bioclim(x=predictors, bioclim.object=Bradypus.bioclim, KML.out=T)
##D ensemble.bioclim(x=predictors, bioclim.object=Bradypus.bioclim3, KML.out=T)
##D 
##D par.old <- graphics::par(no.readonly=T)
##D graphics::par(mfrow=c(1,2))
##D 
##D rasterfull1 <- paste("ensembles//Bradypus_base_BIOCLIM_orig", sep="")
##D raster::plot(raster(rasterfull1), breaks=c(-0.1, 0, 0.5, 1), 
##D     col=c("grey", "blue", "green"), main="original method")
##D rasterfull2 <- paste("ensembles//America_base_BIOCLIM_orig", sep="")
##D raster::plot(raster(rasterfull2), breaks=c(-0.1, 0, 0.5, 1), 
##D     col=c("grey", "blue", "green"), main="America")
##D 
##D graphics::par(par.old)
##D 
##D # compare with implementation bioclim in dismo
##D bioclim.dismo <- bioclim(predictors, p=pres)
##D rasterfull2 <- paste("ensembles//Bradypus_base_BIOCLIM_dismo", sep="")
##D raster::predict(object=predictors, model=bioclim.dismo, na.rm=TRUE, 
##D     filename=rasterfull2, progress='text', overwrite=TRUE)
##D 
##D par.old <- graphics::par(no.readonly=T)
##D graphics::par(mfrow=c(1,2))
##D 
##D raster::plot(raster(rasterfull1), breaks=c(-0.1, 0, 0.5, 1), 
##D     col=c("grey", "blue", "green"), main="original method")
##D raster::plot(raster(rasterfull2), main="dismo method")
##D 
##D graphics::par(par.old)
##D 
##D # use dummy variables to deal with factors
##D predictors <- stack(predictor.files)
##D biome.layer <- predictors[["biome"]]
##D biome.layer
##D ensemble.dummy.variables(xcat=biome.layer, most.frequent=0, freq.min=1,
##D     overwrite=TRUE)
##D 
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D predictors.dummy <- subset(predictors, subset=c("biome_1", "biome_2",  "biome_3",  
##D     "biome_4", "biome_5", "biome_7",  "biome_8",  "biome_9", "biome_10", 
##D     "biome_12", "biome_13", "biome_14"))
##D predictors.dummy
##D predictors.dummy@title <- "base_dummy"
##D 
##D Bradypus.dummy <- ensemble.bioclim.object(predictors.dummy, quantiles=T, 
##D     p=pres, species.name="Bradypus")
##D Bradypus.dummy
##D ensemble.bioclim(x=predictors.dummy, bioclim.object=Bradypus.dummy, KML.out=F)
##D 
##D par.old <- graphics::par(no.readonly=T)
##D graphics::par(mfrow=c(1,2))
##D 
##D rasterfull3 <- paste("ensembles//Bradypus_base_dummy_BIOCLIM_orig", sep="")
##D raster::plot(raster(rasterfull1), breaks=c(-0.1, 0, 0.5, 1), col=c("grey", "blue", "green"), 
##D     main="numeric predictors")
##D raster::plot(raster(rasterfull3), breaks=c(-0.1, 0, 0.5, 1), col=c("grey", "blue", "green"), 
##D     main="dummy predictors")
##D 
##D graphics::par(par.old)
## End(Not run)




