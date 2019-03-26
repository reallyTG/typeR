library(rcarbon)


### Name: euroevol
### Title: Radiocarbon dates from the EUROEVOL database
### Aliases: euroevol
### Keywords: datasets

### ** Examples

## Not run: 
##D data(euroevol)
##D Ireland <- subset(euroevol,Country=="Ireland")
##D bins <- binPrep(Ireland$SiteID,Ireland$C14Age,h=200)
##D x <- calibrate(Ireland$C14Age,Ireland$C14SD)
##D spd.ireland <- spd(x,bins=bins,runm=200,timeRange=c(8000,4000))
##D plot(spd.ireland)
## End(Not run)



