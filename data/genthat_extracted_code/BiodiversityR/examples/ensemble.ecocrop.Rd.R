library(BiodiversityR)


### Name: ensemble.ecocrop
### Title: Mapping of novel environmental conditions (areas where some of
###   the environmental conditions are outside the range of environmental
###   conditions of a reference area).
### Aliases: ensemble.ecocrop ensemble.ecocrop.object

### ** Examples


## Not run: 
##D #test with Brazil nut (limits from FAO ecocrop)
##D #temperature: (12) 20-36 (40)
##D #annnual rainfall: (1400) 2400-2800 (3500)
##D 
##D # get predictor variables
##D library(dismo)
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D # subset based on Variance Inflation Factors
##D predictors <- subset(predictors, subset=c("bio5", "bio6", "bio12"))
##D predictors
##D predictors@title <- "base"
##D 
##D Brazil.ecocrop <- ensemble.ecocrop.object(temp.thresholds=c(20, 36, 12, 40), 
##D     rain.thresholds=c(2400, 2800, 1400, 3500), 
##D     annual.temps=FALSE, name="Bertholletia_excelsa")
##D Brazil.ecocrop
##D ensemble.ecocrop(predictors, ecocrop.object=Brazil.ecocrop)
##D 
##D dev.new()
##D par.old <- graphics::par(no.readonly=T)
##D graphics::par(mfrow=c(1,2))
##D 
##D 
##D rasterfull1 <- paste("ensembles//ecocrop//Bertholletia_excelsa_base.grd", sep="")
##D rasterfull1 <- raster(rasterfull1)
##D # raster file saved probabilities as integer values between 0 and 1000
##D rasterfull1 <- rasterfull1/1000
##D raster::plot(rasterfull1, main="Ecocrop suitability")
##D 
##D GBIFloc <- gbif(genus="Bertholletia", species="excelsa", geo=TRUE)
##D GBIFpres <- cbind(GBIFloc$lon, GBIFloc$lat)
##D GBIFpres <- GBIFpres[complete.cases(GBIFpres), ]
##D GBIFpres <- GBIFpres[duplicated(GBIFpres) == FALSE, ]
##D point.suitability <- extract(rasterfull1, y=GBIFpres)
##D point.suitability[is.na(point.suitability)] <- -1
##D 
##D GBIFpres.optimal <- GBIFpres[point.suitability == 1, ]
##D GBIFpres.suboptimal <- GBIFpres[point.suitability < 1 & point.suitability > 0, ]
##D GBIFpres.not <- GBIFpres[point.suitability == 0, ]
##D 
##D raster::plot(rasterfull1, main="GBIF locations", 
##D     sub="blue: optimal, cyan: suboptimal, red: not suitable")
##D bg.legend <- c("blue", "cyan", "red")
##D 
##D points(GBIFpres.suboptimal, pch=21, cex=1.2, bg=bg.legend[2])
##D points(GBIFpres.optimal, pch=21, cex=1.2, bg=bg.legend[1])
##D points(GBIFpres.not, pch=21, cex=1.2, bg=bg.legend[3])
##D 
##D graphics::par(par.old)
## End(Not run)




