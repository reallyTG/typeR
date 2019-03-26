library(itsadug)


### Name: get_fitted
### Title: Get model all fitted values.
### Aliases: get_fitted

### ** Examples

data(simdat)
## Not run: 
##D m1 <- bam(Y ~ Group + s(Time, by=Group)+ s(Subject, bs='re'), data=simdat)
##D 
##D # as.data.frame FALSE and rm.ranef=NULL results in fitted():
##D all( get_fitted(m1) == fitted(m1) )
##D 
##D # now fitted values without random effects:
##D all( get_fitted(m1, rm.ranef=TRUE) == fitted(m1) )
##D head(get_fitted(m1, rm.ranef=TRUE))
##D 
##D # without summary:
##D infoMessages("off")
##D head(get_fitted(m1, rm.ranef=TRUE))
##D infoMessages("on")
## End(Not run)



