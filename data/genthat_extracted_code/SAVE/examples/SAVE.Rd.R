library(SAVE)


### Name: SAVE
### Title: Setting up the analysis of a computer model
### Aliases: SAVE show.SAVE show,SAVE-method show,summary.SAVE-method
###   summary.SAVE summary.SAVE-class summary,SAVE-method show.summary.SAVE

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
##D # summary of the results
##D 
##D summary(gfsw)
## End(Not run)




