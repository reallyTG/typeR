library(ENiRG)


### Name: enirg.predict
### Title: Predicting species' suitable habitat
### Aliases: enirg.predict
### Keywords: HSM prediction

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
##D predictor.names <- c("tann", "mxtwm", "mntcm", "rfdm", "rfseas")
##D predictor.maps <- paste("std_", predictor.names, sep="")
##D file.names <- paste(system.file(package = "ENiRG"),
##D                     "/ext/", predictor.names, ".asc", sep="")
##D 
##D import.egvs(file.names, predictor.names)
##D 
##D # standardization
##D stdz.maps(predictor.names, predictor.maps)
##D 
##D # performing the Ecologigal Niche Factor Analysis (ENFA)
##D enirg(presences.table = lina, qtegv.maps = predictor.maps,
##D       species.name = "African", nf = 1, scannf = FALSE,
##D       method = "normal") -> apis.enfa
##D 
##D enirg.predict(apis.enfa, load.map = TRUE, method = "normal") -> apis.hsm
##D 
## End(Not run)

require(raster)

# Results can be directly loaded from:
data(apis.hsm)

plot(apis.hsm$African_predicted_hsm)
contour(apis.hsm$African_predicted_hsm, add = TRUE)



