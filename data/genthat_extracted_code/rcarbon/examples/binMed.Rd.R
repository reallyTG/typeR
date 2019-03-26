library(rcarbon)


### Name: binMed
### Title: Computes the median date of each bin
### Aliases: binMed

### ** Examples

## Not run: 
##D #Load EUROEVOL Data
##D data(euroevol)
##D #Subset Danish Dates
##D denmark <- subset(euroevol,Country=="Denmark")
##D #Calibrate and Bin
##D denmarkDates <- calibrate(x=denmark$C14Age,errors=denmark$C14SD) 
##D denmarkBins <- binPrep(sites=denmark$SiteID,ages=denmark$C14Age,h=200) #200 years bin size
##D #Compute median date for each bin
##D binMed(x=denmarkDates,bins=denmarkBins)
## End(Not run)



