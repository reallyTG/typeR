library(iWISA)


### Name: SIplot
### Title: Plot Global Storm Activity Index WISA
### Aliases: SIplot

### ** Examples

## Not run: 
##D ## sample records for one week period
##D data(record)
##D coord=matrix(c(124.43, 19.23, 53.77,140.18,68.68,202.00,71.89,293.85),nrow=2,ncol=4)
##D 
##D index.sample<- SAIndex(record, coord, wf="la8")
##D 
##D ## example dates
##D start.date="2001-3-1"
##D end.date="2001-4-30"
##D n.station=4
##D station.names=c("HER","KAK","HON","SJG")
##D 
##D ## plot SI
##D SIplot(index.sample$SI, type=1, start=start.date, end=end.date, 
##D main="WISA estimation", xlab="Datetime", ylab="iWISA Estimation")
## End(Not run)



