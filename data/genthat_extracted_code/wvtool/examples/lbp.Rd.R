library(wvtool)


### Name: lbp
### Title: Local Binary Patterns (lbp)
### Aliases: lbp

### ** Examples

## Not run: 
##D data(camphora)
##D par(mfrow=c(2,2))
##D r1 <- lbp(camphora,1)
##D image(rot90c(r1$lbp.u2),col = gray((0:58)/58), main="lbp.u2 (r=1, 8 points)", useRaster=TRUE, 
##D asp=1, axes=FALSE)
##D image(rot90c(r1$lbp.ori),col = gray((0:255)/255), main="lbp.ori (r=1, 8 points)", useRaster=TRUE, 
##D asp=1, axes=FALSE)
##D hist(r1$lbp.u2,breaks=59, main="Histogram of lbp.u2")
##D hist(r1$lbp.ori,breaks=256, main="Histogram of lbp.ori")
## End(Not run)



