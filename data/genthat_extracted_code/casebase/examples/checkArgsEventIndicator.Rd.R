library(casebase)


### Name: checkArgsEventIndicator
### Title: Check that Event is in Correct Format
### Aliases: checkArgsEventIndicator

### ** Examples


## Not run: 
##D library(survival) # for veteran data
##D checkArgsEventIndicator(data = veteran, event = "celltype", censored.indicator = "smallcell")
##D checkArgsEventIndicator(data = veteran, event = "status")
##D checkArgsEventIndicator(data = veteran, event = "trt") # returns error
##D 
##D url <- "https://raw.githubusercontent.com/sahirbhatnagar/casebase/master/inst/extdata/bmtcrr.csv"
##D bmt <- read.csv(url)
##D checkArgsEventIndicator(data = bmt, event = "Sex", censored.indicator = "M")
##D checkArgsEventIndicator(data = bmt, event = "D", censored.indicator = "AML")
##D checkArgsEventIndicator(data = bmt, event = "D", censored.indicator = "AMLL") #returns error
##D checkArgsEventIndicator(data = bmt, event = "Source")
##D checkArgsEventIndicator(data = bmt, event = "Status")
##D checkArgsEventIndicator(data = bmt, event = "Status", censored.indicator = 3)
## End(Not run)




