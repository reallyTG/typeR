library(SAVE)


### Name: plot.predictreality.SAVE
### Title: A function for plotting summaries of an object of class
###   'predictreality.SAVE'.
### Aliases: plot.predictreality.SAVE plot,predictreality.SAVE-method

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
##D #########
##D # bias-corrected prediction at a set of inputs
##D # using predictreality
##D ##########
##D 
##D load <- c(4.0,5.3)
##D curr <- seq(from=20,to=30,length=20)
##D g <- c(1,2)
##D 
##D xnew<- expand.grid(current = curr, load = load, thickness=g)
##D 
##D # Obtain samples
##D prsw <- predictreality(object=gfsw, newdesign=xnew, tol=1.E-12)
##D 
##D #Plot the results:
##D #Represent reality and tolerance bounds:
##D plot(prsw, option="biascorr")
##D #Represent bias and tolerance bounds:
##D plot(prsw, option="biasfun")
##D 
##D 
## End(Not run)



