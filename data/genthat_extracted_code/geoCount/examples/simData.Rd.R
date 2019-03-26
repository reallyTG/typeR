library(geoCount)


### Name: simData
### Title: Simulate Data Set from Generalized Linear Spatial Model on Given
###   Locations
### Aliases: simData
### Keywords: Data Simulation

### ** Examples

## Not run: 
##D   loc <- rbind(locCircle(0.3, 10),
##D                locCircle(0.6, 30),
##D                locCircle(1.0, 50)
##D                )
##D   dat <- simData(loc, cov.par = c(1, 0.1, 1))
##D   plotData(dat$data, loc)                  
## End(Not run)



