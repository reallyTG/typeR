library(surveillance)


### Name: boda
### Title: Bayesian Outbreak Detection Algorithm (BODA)
### Aliases: boda
### Keywords: classif

### ** Examples

## Not run: 
##D   ## running this example takes a couple of minutes
##D 
##D   #Load the campylobacteriosis data for Germany
##D   data("campyDE")
##D   #Make an sts object from the data.frame
##D   cam.sts <-  sts(epoch=as.numeric(campyDE$date), epochAsDate=TRUE,
##D                   observed=campyDE$case, state=campyDE$state)
##D 
##D   #Define monitoring period
##D #  range <- which(epoch(cam.sts)>=as.Date("2007-01-01"))
##D #  range <- which(epoch(cam.sts)>=as.Date("2011-12-10"))
##D   range <- tail(1:nrow(cam.sts),n=2)
##D 
##D   control <- list(range=range, X=NULL, trend=TRUE, season=TRUE,
##D                   prior='iid', alpha=0.025, mc.munu=100, mc.y=10,
##D                   samplingMethod = "joint")
##D 
##D   #Apply the boda algorithm in its simples form, i.e. spline is
##D   #described by iid random effects and no extra covariates
##D   library("INLA")  # needs to be attached
##D   cam.boda1 <- boda(cam.sts, control=control)
##D 
##D   plot(cam.boda1, xlab='time [weeks]', ylab='No. reported', dx.upperbound=0)
## End(Not run)



