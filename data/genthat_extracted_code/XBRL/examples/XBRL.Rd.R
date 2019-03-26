library(XBRL)


### Name: XBRL
### Title: "Mutable state" function that exposes "methods" that analyze an
###   XBRL instance an its associated DTS.
### Aliases: XBRL
### Keywords: XBRL mid-level

### ** Examples

## Not run: 
##D ## Setting stringsAsFactors = FALSE is highly recommended
##D ## to avoid data frames to create factors from character vectors.
##D options(stringsAsFactors = FALSE)
##D 
##D ## XBRL instance file to be analyzed, accessed
##D ## directly from SEC website:
##D inst <- "https://www.sec.gov/Archives/edgar/data/21344/000002134413000050/ko-20130927.xml"
##D 
##D xbrl <- XBRL()
##D xbrl$setCacheDir("XBRLcache")
##D xbrl$openInstance(inst)
##D ## Perform a discovery of the taxonomy:
##D xbrl$processSchema(xbrl$getSchemaName())
##D ## Process instance file:
##D xbrl$processContexts()
##D xbrl$processUnits()
##D xbrl$processFacts()
##D xbrl$processFootnotes()
##D xbrl$closeInstance()
##D xbrl.vars <- xbrl$getResults()
## End(Not run)



