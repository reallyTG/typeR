library(SAVE)


### Name: predictcode
### Title: Predict values of the computer model at new input points
### Aliases: predictcode summary.predictcode.SAVE
###   summary,predictcode.SAVE-method show.summary.predictcode.SAVE
###   plot,predictcode.SAVE-method predictcode.SAVE-class
###   predictcode,SAVE-method show,predictcode.SAVE-method
###   show,summary.predictcode.SAVE-method plot.predictcode.SAVE

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
##D ##########
##D # emulate the output of the model using predictcode
##D ##########
##D 
##D # construct design at which to emulate the model
##D u <- 3.2
##D load <- c(4.0,5.3)
##D curr <- seq(from=20,to=30,length=20)
##D g <- c(1,2)
##D 
##D xnewpure <- expand.grid(curr,load,g)
##D xnewpure <- cbind(xnewpure,rep(u,dim(xnewpure)[1]))
##D names(xnewpure) <- c("current","load","thickness","tuning")
##D xnewpure <- as.data.frame(xnewpure)
##D 
##D pcsw<- predictcode(object=gfsw, newdesign=xnewpure, n.iter=20000, tol=1.E-12)
##D 	
##D #A summary of the emulation:
##D summary(pcsw)	
##D 
##D #A plot of the emulation
##D plot(pcsw)
## End(Not run)	
	



