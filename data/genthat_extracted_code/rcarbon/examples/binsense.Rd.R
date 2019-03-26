library(rcarbon)


### Name: binsense
### Title: Bin sensitivity Plot
### Aliases: binsense

### ** Examples

## Not run: 
##D data(euroevol)
##D #subset Danish dates
##D denmark=subset(euroevol,Country=="Denmark")
##D denmarkDates=calibrate(x=denmark$C14Age,errors=denmark$C14SD)
##D binsense(x=denmarkDates,y=denmark$SiteID,h=seq(0,200,20),timeRange=c(10000,4000),runm=200)
## End(Not run)



