library(ENiRG)


### Name: classify.map
### Title: Classification of the HSM
### Aliases: classify.map
### Keywords: HSM predict

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
##D       species.name = "African", nf = 3, scannf = FALSE,
##D       method = "normal") -> apis.enfa
##D 
##D enirg.predict(apis.enfa, load.map = TRUE, method = "normal") -> apis.hsm
##D 
##D data(cbi.results)
##D 
##D classify.map(map = "African_predicted_hsm",
##D              suit.classes = cbi.results,
##D              output.name = "African_hsm_class") -> apis.hsm.class
## End(Not run)



