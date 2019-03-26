library(BiodiversityR)


### Name: ensemble.analogue
### Title: Climate analogues from climatic distance raster layers.
### Aliases: ensemble.analogue ensemble.analogue.object

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
##D # instead of searching for current analogue of future climate conditions,
##D # search for analogue in southern hemisphere
##D future.stack <- stack(crop(predictors, y=extent(-125, -32, 0, 40)))
##D future.stack@title <- "north"
##D current.stack <- stack(crop(predictors, y=extent(-125, -32, -56, 0)))
##D current.stack@title <- "south"
##D 
##D # reference location in Florida
##D # in this case future.stack and current.stack are both current
##D ref.loc <- data.frame(t(c(-80.19, 25.76)))
##D names(ref.loc) <- c("lon", "lat")
##D 
##D # climate analogue analysis based on the Mahalanobis distance
##D Florida.object.mahal <- ensemble.analogue.object(ref.location=ref.loc, 
##D     future.stack=future.stack, current.stack=current.stack, 
##D     name="FloridaMahal", method="mahal", an=10000)
##D Florida.object.mahal
##D 
##D Florida.analogue.mahal <- ensemble.analogue(x=current.stack, 
##D     analogue.object=Florida.object.mahal, analogues=50)
##D Florida.analogue.mahal
##D 
##D # climate analogue analysis based on the Euclidean distance and dividing each variable by the sd
##D Florida.object.sd <- ensemble.analogue.object(ref.location=ref.loc, 
##D     future.stack=future.stack, current.stack=current.stack, 
##D     name="FloridaSD", method="sd", z=2)
##D Florida.object.sd
##D 
##D Florida.analogue.sd <- ensemble.analogue(x=current.stack, 
##D     analogue.object=Florida.object.sd, analogues=50)
##D Florida.analogue.sd
##D 
##D # plot analogues on climatic distance maps
##D par(mfrow=c(1,2))
##D analogue.file <- paste(getwd(), "//ensembles//analogue//FloridaMahal_south_analogue.grd", sep="")
##D plot(raster(analogue.file), main="Mahalanobis climatic distance")
##D points(Florida.analogue.sd[3:50, "lat"] ~ Florida.analogue.sd[3:50, "lon"], 
##D     pch=1, col="red", cex=1)
##D points(Florida.analogue.mahal[3:50, "lat"] ~ Florida.analogue.mahal[3:50, "lon"], 
##D     pch=3, col="black", cex=1)
##D points(Florida.analogue.mahal[2, "lat"] ~ Florida.analogue.mahal[2, "lon"], 
##D     pch=22, col="blue", cex=2)
##D legend(x="topright", legend=c("closest", "Mahalanobis", "SD"), pch=c(22, 3 , 1), 
##D     col=c("blue" , "black", "red"))
##D 
##D analogue.file <- paste(getwd(), "//ensembles//analogue//FloridaSD_south_analogue.grd", sep="")
##D plot(raster(analogue.file), main="Climatic distance normalized by standard deviation")
##D points(Florida.analogue.mahal[3:50, "lat"] ~ Florida.analogue.mahal[3:50, "lon"], 
##D     pch=3, col="black", cex=1)
##D points(Florida.analogue.sd[3:50, "lat"] ~ Florida.analogue.sd[3:50, "lon"], 
##D     pch=1, col="red", cex=1)
##D points(Florida.analogue.sd[2, "lat"] ~ Florida.analogue.sd[2, "lon"], 
##D     pch=22, col="blue", cex=2)
##D legend(x="topright", legend=c("closest", "Mahalanobis", "SD"), pch=c(22, 3 , 1), 
##D     col=c("blue" , "black", "red"))
##D par(mfrow=c(1,1))
## End(Not run)




