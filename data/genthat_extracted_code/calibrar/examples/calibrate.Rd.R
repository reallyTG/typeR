library(calibrar)


### Name: calibrate
### Title: Sequential parameter estimation for the calibration of models
### Aliases: calibrate

### ** Examples

calibrate(par=rep(NA, 5), fn=SphereN)
## Not run: 
##D calibrate(par=rep(NA, 5), fn=SphereN, replicates=3)
##D calibrate(par=rep(0.5, 5), fn=SphereN, replicates=3, lower=-5, upper=5)
##D calibrate(par=rep(0.5, 5), fn=SphereN, replicates=3, lower=-5, upper=5, phases=c(1,1,1,2,3))
##D calibrate(par=rep(0.5, 5), fn=SphereN, replicates=c(1,1,4), lower=-5, upper=5, phases=c(1,1,1,2,3))
## End(Not run)



