library(agridat)


### Name: kulkarni.sorghum.uniformity
### Title: Uniformity trial of sorghum
### Aliases: kulkarni.sorghum.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D   data(kulkarni.sorghum.uniformity)
##D   dat <- kulkarni.sorghum.uniformity
##D   
##D   # match means on page 462
##D   # tapply(dat$yield, dat$year, mean)
##D   #     1930     1931     1932 
##D   # 116.2875  67.2250 126.3688 
##D 
##D   require(reshape2)
##D   require(lattice)
##D   dmat <- acast(dat, row+col ~ year, value.var="yield")
##D   splom(dmat, main="kulkarni.sorghum.uniformity")
##D   cor(dmat)
##D 
##D   require(desplot)
##D   desplot(yield ~ col*row|year, dat,
##D           flip=TRUE, aspect=150/290,
##D           main="kulkarni.sorghum.uniformity")
##D   
## End(Not run)



