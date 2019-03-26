library(mable)


### Name: mable-package
### Title: MABLE: Maximum Approximate Bernstein Likelihood Estimation
### Aliases: mable-package mable
### Keywords: package

### ** Examples

## No test: 
# Beta distribution
n<-50; m0<-2; m1<-20
set.seed(1234567)
x<-rbeta(n,7,5)
res<-mable.optim(x, m0, m1)
op<-par(mfrow=c(2,2), mar=c(4,4,2,1))
plot(m0:m1, res$Llik, type="b", xlab="m", ylab="Loglikelihook l(m)")
segments(m<-res$opti.m, 0, m, res$llik, lty=2, col=2)
plot((m0+1):m1, lr<-res$lr, type="b", xlab="m",
                         ylab="LR for Change-Point: R(m)")
segments(m, 0, m, max(lr), lty=2, col=2)
plot(y<-seq(0,1,len=512), dbeta(y,7,5), type="l", xlab="x",
            ylab="f(x)", ylim=c(0, 3.1))
plotmable(res, lty=2, col=2)
lines(density(x, n=512, from=0, to=1), lty=4, col=4)
legend(0, 2.7, bty="n", cex=.8, lty=c(1,2,4),col=c(1,2,4),
           c("TRUE: f",expression(paste("MABLE:",hat(f))),
                 expression(paste("KDE:",tilde(f)))))
plot(y, pbeta(y,7,5), type="l", xlab="x", ylab="F(x)",
                main="CDF of beta(7,5)")
plotmable(res, density=FALSE, lty=2,col=2)
lines(ecdf(x), do.points =FALSE, verticals = TRUE, lty=4, col=4)
legend(0, 1, bty="n", cex=.8, lty=c(1,2,4),col=c(1,2,4),
     c("TRUE: F", expression(paste("MABLE:",hat(F))),
                            expression(paste("ECDF:",F[n]))))
par(op)

# Normal distribution
n<-30; m0<-2; m1<-30
set.seed(13579)
x<-rnorm(n); a<--4; b<-4
res<-mable.optim(x, m0, m1, a, b)
op<-par(mfrow=c(2,2), mar=c(4,4,2,1))
plot(m0:m1, res$Llik, type="b", xlab="m", ylab="Loglikelihook l(m)")
segments(m<-res$opti.m, 0, m, res$llik, lty=2, col=2)
plot((m0+1):m1, lr<-res$lr, type="b", xlab="m",
                              ylab="LR for Change-Point:  R(m)")
segments(m, 0, m, max(lr), lty=2, col=2)
plot(y<-seq(a,b,len=512), dnorm(y), type="l", xlab="x", ylab="f(x)")
plotmable(res, lty=2, col=2)
lines(density(x, n=512, from=a, to=b), lty=4, col=4)
legend(-4, .4, bty="n", cex=.8, lty=c(1,2,4),col=c(1,2,4),
    c("TRUE: f", expression(paste("MABLE:",hat(f))),
                       expression(paste("KDE:",tilde(f)))))
plot(y, pnorm(y), type="l", xlab="x", ylab="F(x)")
plotmable(res, density=FALSE, lty=2, col=2)
lines(ecdf(x), do.points =FALSE, verticals = TRUE, lty=4, col=4)
legend(-4, 1, bty="n", cex=.8, lty=c(1,2,4),col=c(1,2,4),
    c("TRUE: F", expression(paste("MABLE:",hat(F))),
                             expression(paste("ECDF:",F[n]))))
par(op)
## End(No test)



