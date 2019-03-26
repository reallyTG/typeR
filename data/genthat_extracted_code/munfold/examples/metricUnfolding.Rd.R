library(munfold)


### Name: unfold
### Title: Metric Unfolding
### Aliases: unfold biplot.unfolding plot.unfolding uapply unfold.matrix
###   unfold.formula
### Keywords: multivariate hplot

### ** Examples

r <- seq(from=0,to=2*pi,length=24)
a1 <- cos(r)*4 + 0.00001*rnorm(r)
a2 <- sin(r)*4 + 0.00001*rnorm(r)
b1 <- c(.5,-.5,-.5,.5)*3 + 5
b2 <- c(.5,.5,-.5,-.5)*3 + 1

D1 <- outer(b1,a1,"-")
D2 <- outer(b2,a2,"-")

Dsq <- D1^2+D2^2


Dsq.uf<-unfold(sqrt(Dsq),squared=FALSE)

oldpar <- par(mfrow=c(1,2))
A <- cbind(a1,a2)
B <- cbind(b1,b2)

ltype <- c(rep(1,NROW(A)),rep(2,NROW(A)))

orig <- rbind(A,B)
unfolded <- rbind(Dsq.uf$A,Dsq.uf$B)

xlim <- ylim <- range(orig)#*1.5

plot(A,type="b",pch=1,
    xlim=xlim,ylim=ylim,
    xlab="Dimension 1",ylab="Dimension 2",main=expression("Original data"),asp=1)
lines(B,type="b",pch=3,lty=2)
abline(h=0,v=0,lty=3)

biplot(Dsq.uf,type="b",
    xlim=xlim,ylim=ylim,
    main=expression(paste(italic(unfold)," solution")),asp=1)


par(oldpar)




