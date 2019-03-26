library(openCR)


### Name: derived
### Title: Derived Parameters From openCR Models
### Aliases: derived.openCR derived.openCRlist openCR.esa openCR.pdot
### Keywords: models

### ** Examples


# override default method to get true ML for L1
L1CL <- openCR.fit(ovenCH, type = 'JSSAlCL', method = 'Nelder-Mead')
predict(L1CL)
derived(L1CL)

## Not run: 
##D ## compare to above
##D L1 <- openCR.fit(ovenCH, type = 'JSSAl', method = 'Nelder-Mead')
##D predict(L1)
##D derived(L1)
## End(Not run)




