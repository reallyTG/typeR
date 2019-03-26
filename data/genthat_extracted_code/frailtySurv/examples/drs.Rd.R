library(frailtySurv)


### Name: drs
### Title: Diabetic Retinopathy Study (DRS)
### Aliases: drs
### Keywords: datasets

### ** Examples

## Not run: 
##D data(drs)
##D 
##D # Clustered by subject
##D fit.drs <- fitfrail(Surv(time, status) ~ treated + cluster(subject_id), 
##D                     drs, frailty="gamma")
##D 
##D fit.drs
##D 
##D # Variance estimates
##D vcov(fit.drs)
##D 
##D # Plot the estimated cumulative baseline hazard
##D plot(fit.drs, type="cumhaz")
## End(Not run)



