library(plsRglm)


### Name: tilt.bootpls
### Title: Tilted bootstrap for PLS models
### Aliases: tilt.bootpls
### Keywords: models

### ** Examples

## Not run: 
##D data(Cornell)
##D XCornell<-Cornell[,1:7]
##D yCornell<-Cornell[,8]
##D 
##D set.seed(1385)
##D Cornell.tilt.boot <- tilt.bootpls(plsR(yCornell,XCornell,3), statistic=coefs.plsR, 
##D R=c(499, 100, 100), alpha=c(0.025, 0.975), sim="ordinary", stype="i", index=1)
##D Cornell.tilt.boot
##D str(Cornell.tilt.boot)
##D 
##D boxplots.bootpls(Cornell.tilt.boot,indices=2:7)
##D 
##D rm(Cornell.tilt.boot)
## End(Not run)



