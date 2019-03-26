library(iWISA)


### Name: sqplot
### Title: Plot of Non-constant Solar Quiet Daily Variation
### Aliases: sqplot

### ** Examples

## data sets.

## Colatitude and longitude of geomagnetic observatories.
## Not run: 
##D coord=matrix(c(124.43, 19.23, 53.77,140.18,68.68,202.00,71.89,293.85),nrow=2,ncol=4)
##D 
##D 
##D ## Estimation of SI index
##D index.sample<- SAIndex(record, coord, wf="la8")
##D si.v<-index.sample$SI
##D 
##D 
##D ## generate datetime for one week period
##D start.date="2001-3-1"
##D end.date="2001-4-30"
##D 
##D ## estimation of sq
##D Sq<- SQ (datasq, si.v=si.v, wf = "la8")
##D 
##D sqplot(Sq, Title="Sq variation", start = start.date, end=end.date, n.station=4,
##D       graphs.per.page=2, station.names=c("ABG","PHU","TUC","FRD"))
## End(Not run)



