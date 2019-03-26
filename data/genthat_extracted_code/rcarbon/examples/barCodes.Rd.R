library(rcarbon)


### Name: barCodes
### Title: Plot the median values of calibrated radiocarbon dates or bins
### Aliases: barCodes

### ** Examples

## Not run: 
##D #Load EUROEVOL Data
##D data(euroevol)
##D 
##D #Subset Danish Dates
##D denmark <- subset(euroevol,Country=="Denmark")
##D 
##D #Calibrate and Bin
##D denmarkDates <- calibrate(x=denmark$C14Age,errors=denmark$C14SD) 
##D denmarkBins <- binPrep(sites=denmark$SiteID,ages=denmark$C14Age,h=200) #200 years bin size
##D 
##D #Compute median date for each bin
##D bm <- binMed(x=denmarkDates,bins=denmarkBins)
##D 
##D #Compute median date for each date
##D dm <- medCal(denmarkDates)
##D 
##D #Compute SPD 
##D denmarkSPD <- spd(x=denmarkDates,bins=denmarkBins,timeRange=c(10000,4000))
##D 
##D #Plot SPD and barCodes of median dates
##D plot(denmarkSPD,runm=200)
##D barCodes(dm,yrng=c(0,0.01)) 
##D 
##D #Plot SPD and barCodes of median bins in BC/AD
##D plot(denmarkSPD,runm=200,calendar="BCAD")
##D barCodes(BPtoBCAD(bm),yrng=c(0,0.01)) 
## End(Not run)



