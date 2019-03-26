library(mable)


### Name: mable.optim.group
### Title: Fit grouped data with the Bernstein polynomial model with an
###   optimal degree m
### Aliases: mable.optim.group
### Keywords: ~distribution ~models ~nonparametric ~smooth

### ** Examples

## No test: 
# Chicken Embryo Data
data(chicken.embryo)
m0<-2; m1<-30; a<-0; b<-21
t<-((a:b)-a)/(b-a);
day<-chicken.embryo$day; nT<-chicken.embryo$nT;
Day<-rep(day,nT)
res<-mable.optim.group(x=nT, t, m0, m1)
p<-res$phat; m<-res$opti.m
op<-par(mfrow=c(1,2), lwd=2)
layout(rbind(c(1, 2), c(3, 3)))
plot(m0:m1, Lk<-res$Llik, type="b", xlab="m",
      ylab=expression(paste("Loglikelihook ",  "\u2113", "(m)")))
segments(m,-130, m, Lk[m], lty=2, col=2)
text(m+5,-119, expression(paste(hat(m)==13)),pos=4, cex=1.5)
arrows(m+5.5, -119.5, m,-121.4, length =.07, angle =20, code=2)
plot((m0+1):m1, lr<-res$lr, type="b", xlab="m", ylim=c(0, max(lr)),
     ylab="Likelihood Ratio: R(m)")
segments(m,-10, m, lr[m-2], lty=2, col=2)
text(m+3,5, expression(hat(m)==13),pos=4, cex=1.5)
arrows(m+3.45, 4.3, m,-.7, length = .07, angle = 20, code = 2)
u<-seq(0,1,len=100); y<-a+(b-a)*u
fb<-bern.approx(u, p=res$phat)/(b-a)
fk<-density(x=rep((0:20)+.5, nT), bw="sj", n=101, from=a, to=b)
hist(Day, breaks=seq(a,b,  length=12), freq=FALSE,
         main="Histogram and Density Estimates")
lines(y, fb, lty=2, col=2)
lines(fk, lty=3, col=3)
legend(14, .2, lty=1:3, c("Histogram", "MABLE", "Kernel"),
               bty="n", col=1:3)
par(op)
## End(No test)



