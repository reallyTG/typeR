library(highD2pop)


### Name: build2popData_muYafunction
### Title: Data simulator for the high-dimensional two-sample setting
### Aliases: build2popData_muYafunction
### Keywords: datagen multivariate

### ** Examples

## Not run: 
##D DATA <-build2popData(	
##D 	n = 15,
##D 	m = 20,
##D 	p = 500,
##D 	muX = rep(0,500),
##D 	muY = rep(0,500),
##D 	commoncov = FALSE,
##D 	VarscaleY = 2,
##D 	dep = "ARMA",
##D 	ARMAparms = list(coefs=list(ma=c(.2,.3) , ar=c(.4,-.1))),
##D 	LRparm = .75,
##D 	S = 25,
##D 	innov = function(n,...) rnorm(n,0,1),
##D 	heteroscedastic=TRUE,
##D 	het.diag = diag(.1 + rexp(500,1/2))
##D 	)
## End(Not run)



