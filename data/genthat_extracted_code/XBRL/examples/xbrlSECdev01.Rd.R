library(XBRL)


### Name: xbrlSECdev01
### Title: "Mutable state" function that exposes "methods" that analyze a
###   US SEC submission.
### Aliases: xbrlSECdev01
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
##D xbrl.vars <- xbrlDoAll(inst)
##D xbrl.sec <- xbrlSECdev01(xbrl.vars)
##D xbrl.sec$showPresentationHierarchy(showLabels=TRUE, showFacts=TRUE)
## End(Not run)



