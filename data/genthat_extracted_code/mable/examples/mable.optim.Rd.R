library(mable)


### Name: mable.optim
### Title: Fit raw data with the Bernstein polynomial model with optimal
###   degree m
### Aliases: mable.optim
### Keywords: ~distribution ~models ~nonparametric ~smooth

### ** Examples

## No test: 
# Vaal Rive Flow Data
data(Vaal.Flow)
x<-Vaal.Flow
a<-0
b<-3000
res<-mable.optim(x, m0=2, m1=40, a, b)
m<-res$opti.m
p<-res$phat
op<-par(mfrow=c(1,2))
layout(rbind(c(1, 2), c(3, 3)))
plot(2:40, Lk<-res$Llik, type="b", pch=20,  xlab="m",
                      ylab="Loglikelihook  \u2113(m)")
segments(m,-10, m, Lk[m], lty=2, col=2)
text(m+5.3,45, expression(paste(hat(m)==19)),pos=4)
arrows(m+5, 44, m,41, length = .07, angle = 20, code = 2)
plot(3:40, lr<-res$lr, type="b", pch=20, xlab="m",
                    ylab="LR for Change-Point: R(m)")
segments(m,-1, m, lr[m-2], lty=2, col=2)
text(m+5.1,3.5, expression(hat(m)==19),pos=4)
arrows(m+5, 3.0, m,-1, length = .07, angle = 20, code = 2)
op<-par(lwd=2)
hist(x, prob=TRUE, xlim=c(a,b), ylim=c(0,.0022), breaks=100*(0:30),
  main="Histogram and Densities of the Annual Flow of Vaal River",
border="dark grey",lwd=1,xlab="x", ylab="f(x)", col ="light grey")
lines(density(x, bw = "nrd0", adjust = 1), lty=4, col = 4)
lines(y<-seq(a, b, length=100), dlnorm(y, mean(log(x)),
                   sqrt(var(log(x)))), lty=2, col=2)
lines(y, bern.approx((y-a)/(b-a), p)/(b-a), col=1)
legend(1500, .0015, lty=c(1,2, 4), col=c(1,2, 4), bty="n",
c(expression(paste("MABLE:",hat(f)[B](x))),
        expression(paste("Log-Normal:",hat(f)[P](x))),
               expression(paste("KDE:",hat(f)[K](x)))))
par(op)
## End(No test)
## Not run: 
##D # Old Faithful Data
##D   library(mixtools)
##D   x<-faithful$eruptions
##D   a<-0; b<-7
##D   u<-seq(0,1,len=512); v<-(b-a)*u+a
##D   mu<-c(2,4.5); sig<-c(1,1)
##D   pmixem<-normalmixEM(x,.5,mu, sig)
##D   y1<-pmixem$lambda[1]*dnorm(v,pmixem$mu[1], pmixem$sigma[1])
##D       +pmixem$lambda[2]*dnorm(v,pmixem$mu[2],pmixem$sigma[2])
##D   x0<-(x-a)/(b-a); m0<-2; m1<-300
##D   res<-mable.optim(x0, m0, m1, maxit=2000, eps=1.0e-4)
##D   m<-res$opti.m; p<-res$phat
##D   op<-par(mfrow=c(1,2))
##D   layout(rbind(c(1, 2), c(3, 3)))
##D   plot(m0:m1, res$Llik, type="b", pch=20,  xlab="m",
##D        ylab="Loglikelihook  \u2113(m)")
##D   segments(m,-10, m, res$Llik[m], lty=2, col=2)
##D   text(m+20,100, expression(paste(hat(m)==94)),pos=4)
##D   arrows(m+24, 95, m,70, length = .07, angle = 20, code = 2)
##D   plot((m0+1):m1, res$lr, type="b", pch=20, xlab="m",
##D                            ylab="Likelihood Ratio:  R(m)")
##D   segments(m-2,-10, m-2, res$lr[m-2], lty=2, col=2)
##D   text(m+20,40, expression(hat(m)==94),pos=4)
##D   arrows(m+20, 30, m,-7, length = .07, angle = 20, code = 2)
##D   hist(x, breaks=seq(0,7.5,len=20), xlim=c(0,7), ylim=c(0,.7),
##D      prob =TRUE,xlab="t", ylab="f(t)", col ="light grey",
##D      main="Histogram and Density of
##D                Duration of Eruptions of Old Faithful")
##D   lines(density(x, bw = "nrd0", adjust = 1), lty=4, col = 4, lwd=2)
##D   lines(v, bern.approx(u, p)/(b-a), lty=1, col = 1, lwd=2)
##D   lines(v, y1, lty=5, col=3, lwd=2)
##D   legend(6,.4, lty=c(5,1,4), col=c(3,1,4), lwd=2, bty="n",
##D        c(expression(hat(f)[P](t)),expression(hat(f)[B](t)),
##D                   expression(hat(f)[K](t))))
##D   par(op)
## End(Not run)



