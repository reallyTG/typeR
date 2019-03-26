library(openCR)


### Name: moving.fit
### Title: Moving Window Functions
### Aliases: moving.fit extractFocal

### ** Examples


## number of individuals detected
moving.fit(capthist = OVpossumCH, FUN = nrow)

## Not run: 
##D 
##D ## if package R2ucare installed
##D if (requireNamespace("R2ucare"))
##D     moving.fit(capthist = OVpossumCH, FUN = ucare.cjs, width = 5, tests = "overall_CJS")
##D 
##D ## using default FUN = openCR.fit
##D 
##D mf1 <- moving.fit(capthist = OVpossumCH, type = 'JSSAfCL', 
##D      model = list(p~t, phi~t))
##D lapply(mf1, predict)
##D extractFocal(mf1)
##D      
##D msk <- make.mask(traps(OVpossumCH[[1]]), nx = 32)
##D mf2 <- moving.fit(capthist = OVpossumCH, mask = msk, type = 'JSSAsecrfCL')
##D extractFocal(mf2)
##D 
## End(Not run)




