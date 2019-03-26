library(fractal)


### Name: determinism
### Title: Detecting determinism in a time series
### Aliases: determinism eda.plot.determinism plot.determinism
###   print.determinism summary.determinism
### Keywords: univar models nonlinear

### ** Examples

## Not run: 
##D ## perform a determinism test for the beamchaos 
##D ## series. in order to do so, it is vitally 
##D ## important to provide the proper orbital lag, 
##D ## which can be estimated as the lag value 
##D ## associated with the first common maxima over 
##D ## all contours in a spaceTime plot. 
##D plot(spaceTime(beamchaos))
##D 
##D ## we esimate an appropriate olag of 30, and 
##D ## subsequently perform the deterrminism test 
##D beam.det <- determinism(beamchaos, olag=30)
##D print(beam.det)
##D plot(beam.det)
##D 
##D eda.plot(beam.det)
##D 
##D ## perform a similar analysis for a Gaussian white 
##D ## noise realization 
##D rnorm.det <- determinism(rnorm(1024),olag=1)
##D print(rnorm.det)
##D plot(rnorm.det)
##D 
##D eda.plot(rnorm.det)
## End(Not run)



