library(BIFIEsurvey)


### Name: BIFIE.data.boot
### Title: Create 'BIFIE.data' Object based on Bootstrap
### Aliases: BIFIE.data.boot
### Keywords: BIFIEdata

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Bootstrap TIMSS data set
##D #############################################################################
##D data(data.timss1)
##D 
##D # bootstrap samples using weights
##D bifieobj1 <- BIFIEsurvey::BIFIE.data.boot( data.timss1, wgt="TOTWGT" )
##D summary(bifieobj1)
##D 
##D # bootstrap samples without weights
##D bifieobj2 <- BIFIEsurvey::BIFIE.data.boot( data.timss1  )
##D summary(bifieobj2)
## End(Not run)



