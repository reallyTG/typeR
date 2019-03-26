library(mirt)


### Name: extract.mirt
### Title: Extract various elements from estimated model objects
### Aliases: extract.mirt
### Keywords: extract

### ** Examples


## Not run: 
##D mod <- mirt(Science, 1)
##D 
##D extract.mirt(mod, 'logLik')
##D extract.mirt(mod, 'F')
##D 
##D #multiple group model
##D grp <- rep(c('G1', 'G2'), each = nrow(Science)/2)
##D mod2 <- multipleGroup(Science, 1, grp)
##D 
##D grp1 <- extract.group(mod2, 1) #extract single group model
##D extract.mirt(mod2, 'parvec')
##D extract.mirt(grp1, 'parvec')
##D 
## End(Not run)



