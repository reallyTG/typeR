library(ENiRG)


### Name: enirg.plot
### Title: Ordination plot of 'enirg' results
### Aliases: enirg.plot
### Keywords: ordination enirg ENFA

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
##D enirg.plot(apis.enfa)
##D 
## End(Not run)



