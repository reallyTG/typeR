library(HMDHFDplus)


### Name: readJMDweb
### Title: read data from the Japan Mortality Database into R
### Aliases: readJMDweb

### ** Examples

## Not run: 
##D library(HMDHFDplus)
##D # grab prefecture codes (including All Japan)
##D prefectures <- getJMDprefectures()
##D # grab all mltper_5x5
##D # and stick into long data.frame: 
##D mltper <- do.call(rbind, lapply(prefectures, function(prefID){
##D                    Dat        <- readJMDweb(prefID = prefID, item = "mltper_5x5", fixup = TRUE)
##D                    Dat$PrefID <- prefID
##D                    Dat
##D }))
## End(Not run)




