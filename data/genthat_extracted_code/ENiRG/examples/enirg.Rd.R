library(ENiRG)


### Name: enirg
### Title: Ecological Niche in R-Grass
### Aliases: enirg
### Keywords: ENFA GRASS niche

### ** Examples

## Not run: 
##D # starting GRASS session
##D initGRASS("/usr/bin/grass-7.0.0", home=tempdir())
##D initGRASS("C:/GRASS", home=tempdir())
##D 
##D data(apis.enirg)
##D 
##D # presences table
##D lina <- apis.enirg$presences
##D 
##D # loading the environmental information in batch
##D predictor.names <- c("tann", "mntcm", "rfdm", "rfwm")
##D predictor.maps <- paste("std_", predictor.names, sep="")
##D file.names <- paste(system.file(package = "ENiRG"),
##D                     "/ext/", predictor.names, ".asc", sep="")
##D 
##D import.egvs(file.names, predictor.names)
##D 
##D # standardization
##D stdz.maps(predictor.names, predictor.maps)
##D 
##D # setting the mask
##D mask.file <- paste(system.file(package = "ENiRG"),
##D                     "/ext/", "mask.asc", sep="")
##D import.egvs(mask.file, "mask")
##D 
##D # performing the Ecologigal Niche Factor Analysis (ENFA)
##D enirg(presences.table = lina, qtegv.maps = predictor.maps,
##D       species.name = "African", nf = 3,
##D       scannf = FALSE, load.maps = TRUE
##D       map.center = "mask", method = "normal") -> apis.enirg
##D 
##D summary(apis.enirg)
##D 
##D require(raster)
##D plot(apis.enirg$African_li_Mar)
##D plot(apis.enirg$African_li_Spec1)
## End(Not run)



