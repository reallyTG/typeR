library(iWISA)


### Name: SQ
### Title: Estimation of Solar Quiet (SQ) Variation
### Aliases: SQ

### ** Examples

## Not run: 
##D ## example data
##D data(record)
##D coord=matrix(c(124.43, 19.23, 53.77,140.18,68.68,202.00,71.89,293.85),nrow=2,ncol=4)
##D 
##D ## Estimation of SI index
##D index.sample<- SAIndex(record, coord, wf="la8")
##D si.v<-index.sample$SI
##D 
##D ## example data of stations which are different from the ones that are used to estimate SI
##D ## index.
##D ## estimation of sq
##D Sq<-SQ (datasq, si.v=si.v, wf = "la8")
##D start.date="2001-3-1"
##D end.date="2001-4-30"
##D sqplot(Sq, Title="Sq variation", start = start.date, end=end.date, n.station=4,
##D       graphs.per.page=2, station.names=c("ABG","PHU","TUC","FRD"))
## End(Not run)



