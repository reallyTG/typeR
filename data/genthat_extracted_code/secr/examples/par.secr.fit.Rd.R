library(secr)


### Name: par.secr.fit
### Title: Fit Multiple SECR Models
### Aliases: par.secr.fit par.derived par.region.N
### Keywords: model

### ** Examples

## Not run: 
##D 
##D fit0 <- list(capthist = 'captdata', model = g0~1) 
##D fitb <- list(capthist = 'captdata', model = g0~b)
##D fits <- par.secr.fit (c('fit0','fitb'), ncores = 2)
##D AIC(fits)
##D 
##D par.derived(fits, ncores = 2, se.esa = FALSE)
##D 
##D par.region.N(fits, ncores = 2)
##D 
## End(Not run)



