library(openCR)


### Name: par.openCR.fit
### Title: Fit Multiple openCR Models
### Aliases: par.openCR.fit openCRlist
### Keywords: model

### ** Examples

## Not run: 
##D 
##D m1 <- list(capthist = ovenCH, model = list(p~1, phi~1)) 
##D m2 <- list(capthist = ovenCH, model = list(p~session, phi~1))
##D m3 <- list(capthist = ovenCH, model = list(p~session, phi~session) )
##D fits <- par.openCR.fit (c('m1','m2','m3'), ncores = 3)
##D AIC(fits)
##D 
## End(Not run)



