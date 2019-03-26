library(seasonal)


### Name: udg
### Title: Diagnostical Statistics
### Aliases: udg qs AIC.seas BIC.seas nobs.seas logLik.seas

### ** Examples

## Not run: 
##D m <- seas(AirPassengers, x11 = "")
##D 
##D qs(m)
##D AIC(m)
##D BIC(m)
##D nobs(m)
##D logLik(m)
##D 
##D # a list with all entries from udg
##D udg(m)
##D 
##D # extracting a few selected stats from udg
##D udg(m, c("f3.m02", "f3.m05", "qsori"))  # returns a list
##D udg(m, c("f3.m02", "f3.m05"))           # returns a vector
##D 
##D # faster than:
##D udg(m)[c("f3.m01", "f3.m02", "qsori")]
## End(Not run)



