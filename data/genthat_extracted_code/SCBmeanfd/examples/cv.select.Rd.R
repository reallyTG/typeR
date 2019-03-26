library(SCBmeanfd)


### Name: cv.select
### Title: Cross-Validation Bandwidth Selection for Local Polynomial
###   Estimation
### Aliases: cv.select

### ** Examples

## Not run: 
##D ## Plasma citrate data
##D ## Compare cross-validation scores and bandwidths  
##D ## for local linear and local quadratic smoothing
##D 
##D data(plasma)
##D time <- 8:21   				
##D ## Local linear smoothing						
##D cv.select(time, plasma, 1)	# local solution h = 3.76, S(h) = 463.08			
##D cv.select(time, plasma, 1, interval = c(.5, 1))	# global solution = .75, S(h) = 439.54
##D 
##D ## Local quadratic smoothing						
##D cv.select(time, plasma, 2)	# global solution h = 1.15, S(h) = 432.75			
##D cv.select(time, plasma, 2, interval = c(1, 1.5))	# same
## End(Not run)



