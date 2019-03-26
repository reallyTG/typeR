library(frailtySurv)


### Name: plot.fitfrail
### Title: Plot method for 'fitfrail' objects
### Aliases: plot.fitfrail

### ** Examples

## Not run: 
##D data(drs)
##D fit.drs <- fitfrail(Surv(time, status) ~ treated + cluster(subject_id), 
##D                     drs, frailty="gamma")
##D 
##D # Plot the parameter and log-likelihood trace
##D plot(fit.drs, type="trace") 
##D 
##D # This may take a while to run. 
##D # Use parameter B to specify the number of repetitions in the weighted bootstrap
##D plot(fit.drs, type="cumhaz", CI=0.95)
## End(Not run)



