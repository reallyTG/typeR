library(rpatrec)


### Name: savgolay
### Title: Perform Savitzgy-Golay smoothing on Time Series Data
### Aliases: savgolay

### ** Examples

savgolay(input=c(1,6,2,46,23,1,2,13,23,35,23,-2,3,23))
## Not run: 
##D #create a standard HS pattern:
##D a <- generator()
##D #add noise to this patterns
##D b <- noise(a,'white',10)
##D #smooth to regain the signal
##D c <- savgolay(b,8,2)
## End(Not run)





