library(SAVE)


### Name: bayesfit
### Title: Bayesian fit
### Aliases: bayesfit bayesfit.SAVE bayesfit,SAVE-method bayesfit

### ** Examples

## Not run: 
##D library(SAVE)
##D 
##D #############
##D # load data
##D #############
##D 
##D data(spotweldfield,package='SAVE')
##D data(spotweldmodel,package='SAVE')
##D 
##D ##############
##D # create the SAVE object which describes the problem and
##D # compute the corresponding mle estimates
##D ##############
##D 
##D gfsw <- SAVE(response.name="diameter", controllable.names=c("current", "load", "thickness"), 
##D 			 calibration.names="tuning", field.data=spotweldfield, 
##D 			 model.data=spotweldmodel, mean.formula=~1, 
##D 			 bestguess=list(tuning=4.0))
##D 
##D ##############
##D # obtain the posterior distribution of the unknown parameters 
##D ##############
##D 
##D gfsw <- bayesfit(object=gfsw, prior=c(uniform("tuning", upper=8, lower=0.8)),
##D 				 n.iter=20000, n.burnin=100, n.thin=2)
##D 
##D # summary of the results
##D summary(gfsw)
##D 	
##D 	
## End(Not run)



