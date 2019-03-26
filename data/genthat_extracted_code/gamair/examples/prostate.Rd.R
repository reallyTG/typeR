library(gamair)


### Name: prostate
### Title: Prostate cancer screening data
### Aliases: prostate
### Keywords: data

### ** Examples

require(gamair);require(mgcv)
data(prostate)
## plot some spectra...
par(mfrow=c(2,3),mar=c(5,5,3,1))
ind <- c(1,163,319)
lab <- list("Healthy","Enlarged","Cancer")
for (i in 1:3) {
  plot(prostate$MZ[ind[i],],prostate$intensity[ind[i],],type="l",ylim=c(0,60),
  xlab="Daltons",ylab="Intensity",main=lab[[i]],cex.axis=1.4,cex.lab=1.6)
  lines(prostate$MZ[ind[i],],prostate$intensity[ind[i]+2,]+5,col=2)
  lines(prostate$MZ[ind[i],],prostate$intensity[ind[i]+4,]+10,col=4)
}
## treat as ordered cat control, bph, cancer
b <- gam(type ~ s(MZ,by=intensity,k=100),family=ocat(R=3),
         data=prostate,method="ML")
## results...
pb <- predict(b,type="response")
plot(b,rug=FALSE,scheme=1,xlab="Daltons",ylab="f(D)",
cex.lab=1.6,cex.axis=1.4,main="a")
plot(factor(prostate$type),pb[,3],cex.lab=1.6,cex.axis=1.4,main="b")
qq.gam(b,rep=100,lev=.95,cex.lab=1.6,cex.axis=1.4,main="c")



