library(fractal)


### Name: infoDim
### Title: Information dimension
### Aliases: infoDim
### Keywords: univar models nonlinear

### ** Examples

## Not run: 
##D ## calculate the information dimension estimates 
##D ## for chaotic beam data using a delay 
##D ## embedding for dimensions 1 through 10 
##D beam.d1 <- infoDim(beamchaos, dim=10)
##D 
##D ## print a summary of the results 
##D print(beam.d1)
##D 
##D ## plot the information dimension curves without 
##D ## regression lines 
##D plot(beam.d1, fit=FALSE, legend=FALSE)
##D 
##D ## plot an extended data analysis plot 
##D eda.plot(beam.d1)
## End(Not run)



