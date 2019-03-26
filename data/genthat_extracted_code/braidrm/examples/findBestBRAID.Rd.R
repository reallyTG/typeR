library(braidrm)


### Name: findBestBRAID
### Title: Select Best Fitting BRAID Surface Model
### Aliases: findBestBRAID findBestBRAID.default findBestBRAID.formula
### Keywords: regression

### ** Examples

data(es8olatmz)
## Not run: 
##D summary(findBestBRAID(cbind(es8olatmz$conc1,es8olatmz$conc2),
##D 				es8olatmz$act,defaults=c(0,-2.7)))
## End(Not run)
## Not run: summary(findBestBRAID(act~conc1+conc2,es8olatmz,defaults=c(0,-2.7),itype=2))
summary(findBestBRAID(act~conc1+conc2,es8olatmz,defaults=c(0,-4),getCIs=FALSE))



