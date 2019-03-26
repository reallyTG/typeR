library(XBRL)


### Name: XBRL-package
### Title: Extraction of business financial information from XBRL
###   documents.
### Aliases: XBRL-package
### Keywords: package XBRL XML

### ** Examples

## Not run: 
##D ## Setting stringsAsFactors = FALSE is highly recommended
##D ## to avoid data frames to create factors from character vectors.
##D options(stringsAsFactors = FALSE)
##D 
##D ## Load the library
##D library(XBRL)
##D 
##D ## XBRL instance file to be analyzed, accessed
##D ## directly from SEC website:
##D inst <- "https://www.sec.gov/Archives/edgar/data/21344/000002134413000050/ko-20130927.xml"
##D 
##D ## Level 1: Function that does all work and returns
##D ## a list of data frames with extracted information:
##D xbrl.vars <- xbrlDoAll(inst, verbose=TRUE)
##D 
##D ## Level 2: Using the XBRL() "mutable state" function:
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
##D 
##D ## Level 3: Using specialized functions that call C++ code directly:
##D ## Parse the instance (doc is an pointer to external memory that needs to be freed):
##D ## NOTE: in this case, inst needs to be a local file, or accessible
##D ##       as http (not https).
##D inst <- "ko-20130927.xml"
##D doc <- xbrlParse(inst)
##D ## Get a data frame with facts:
##D fct <- xbrlProcessFacts(doc)
##D ## Get a data frame with contexts:
##D cts <- xbrlProcessContexts(doc)
##D ## Get a data frame with units:
##D unt <- xbrlProcessUnits(doc)
##D ## Free the external memory used:
##D xbrlFree(doc)
## End(Not run)



