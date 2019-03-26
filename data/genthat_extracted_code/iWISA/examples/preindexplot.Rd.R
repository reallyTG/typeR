library(iWISA)


### Name: preindexplot
### Title: Plot Estimations of Storm Activity Preindex
### Aliases: preindexplot
### Keywords: Preindexplot

### ** Examples

## Not run: 
##D ## data sets.
##D data(record)
##D ## Colatitude and longitude of geomagnetic observatories.
##D coord=matrix(c(124.43, 19.23, 53.77,140.18,68.68,202.00,71.89,293.85),nrow=2,ncol=4)
##D 
##D 
##D ## estimation of one iWISA and one preindex for each stations.
##D data<- SAIndex(record, coord, wf="la8")
##D 
##D ## generate datetime for one week period
##D start.date="2001-3-1"
##D end.date="2001-4-30"
##D 
##D preindexplot(data, Title="Preindex of stations", start = start.date,end=end.date,
##D n.station=4, graphs.per.page=2, station.names=c("HER","KAK","HON","SJG"))
## End(Not run)



