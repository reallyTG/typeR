library(sparr)


### Name: spattemp.density
### Title: Spatiotemporal kernel density estimation
### Aliases: spattemp.density stden

### ** Examples

data(burk)
burkcas <- burk$cases

burkden1 <- spattemp.density(burkcas,tres=128)
summary(burkden1)

## No test: 
hlam <- LIK.spattemp(burkcas,tlim=c(400,5900),verbose=FALSE)
burkden2 <- spattemp.density(burkcas,h=hlam[1],lambda=hlam[2],tlim=c(400,5900),tres=256)
tims <- c(1000,2000,3500)
par(mfcol=c(2,3))
for(i in tims){ 
  plot(burkden2,i,override.par=FALSE,fix.range=TRUE,main=paste("joint",i))
  plot(burkden2,i,"conditional",override.par=FALSE,main=paste("cond.",i))
}
## End(No test)



