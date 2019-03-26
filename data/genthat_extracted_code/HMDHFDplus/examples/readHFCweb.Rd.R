library(HMDHFDplus)


### Name: readHFCweb
### Title: readHFCweb get HFC data straight from the web into R!
### Aliases: readHFCweb

### ** Examples

## Not run: 
##D DF <- readHFCweb("CZE","TFRMAB_TOT")
##D head(DF)
##D DF <- readHFCweb("CZE","ASFRstand_BO")
##D head(DF)
##D 
##D # get ASFRstand_BO for all countries where available:
##D Countries <- getHFCcountries()
##D # takes a minute to run
##D # require(RCurl)
##D HaveBO <- sapply(Countries, function(CNTRY, item){
##D             RCurl::url.exists(paste0("http://www.fertilitydata.org/data/", 
##D CNTRY,"/", CNTRY, "_", item, ".txt"))
##D         }, item = "ASFRstand_BO")
##D # we grab data for these countries:
##D (Countries <- Countries[HaveBO])
##D 
##D # Also takes 1-15 min depending on internet connection and machine
##D # read in one at a time and stick together into long data.frame
##D allBO <- do.call(rbind,
##D         # this is the iteration of reading in
##D         lapply(Countries, function(CNTRY){
##D             readHFCweb(CNTRY, item = "ASFRstand_BO")
##D              })) # closes off the meta-rbind thingy
##D dim(allBO) # [1] 133237     31
##D unique(allBO$CNTRY)
##D 
## End(Not run)




