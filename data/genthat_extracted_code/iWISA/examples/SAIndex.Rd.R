library(iWISA)


### Name: SAIndex
### Title: Estimate Index and Preindex of Storm Activity
### Aliases: SAIndex

### ** Examples

## Not run: 
##D ## data sets.
##D data(record)
##D ## Colatitude and longitude of geomagnetic observatories.
##D coord=matrix(c(124.43, 19.23, 53.77,140.18,68.68,202.00,71.89,293.85),nrow=2,ncol=4)
##D 
##D 
##D ## estimate WISA and preindex for each stations.
##D index.sample<- SAIndex(record, coord, wf="la8")
##D 
##D ## plot SI
##D start.date="2001-3-1"
##D end.date="2001-4-30"
##D n.station=4
##D station.names=c("HER","KAK","HON","SJG")
##D 
##D 
##D SIplot(index.sample$SI, type=1,start=start.date, end=end.date, 
##D main="WISA estimation", xlab="Datetime", ylab="iWISA Estimation")
## End(Not run)




