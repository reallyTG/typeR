library(HMDHFDplus)


### Name: readCHMDweb
### Title: read data from the Canadian Human Mortality Database into R
### Aliases: readCHMDweb

### ** Examples

## Not run: 
##D library(HMDHFDplus)
##D # grab province codes (including All Canada)
##D provs <- getCHMDprovinces()
##D # grab all mltper_5x5  
##D # and stick into long data.frame: 
##D mltper <- do.call(rbind, lapply(provs, function(provID){
##D                    Dat        <- readCHMDweb(provID = provID, item = "mltper_5x5", fixup = TRUE)
##D                    Dat$provID <- provID
##D                    Dat
##D }))
## End(Not run)




