library(rpatrec)


### Name: mav
### Title: Compute the moving average, exponential average or running
###   median.
### Aliases: mav

### ** Examples

## Not run: 
##D #create a standard HS pattern:
##D a <- generator()
##D #add noise to this patterns
##D b <- noise(a,'white',10)
##D #smooth to regain the signal
##D c <- kernel(b,2)
## End(Not run)
##simply test the smoother
mav(1:10,5,'exponential')




