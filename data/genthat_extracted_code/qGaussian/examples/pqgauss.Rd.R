library(qGaussian)


### Name: pqgauss
### Title: The q-gaussian Distribution
### Aliases: pqgauss

### ** Examples

 qv <- c(2.8,2.5,2,1.01,0,-5); nn <- 700
 xrg <- sqrt((3-qv[6])/(1-qv[6]))
 xr <- seq(-xrg,xrg,by=2*xrg/nn)
 y0 <- dqgauss(xr,qv[6])
 plot(xr,y0,ty='l',xlim=range(-4.5,4.5),ylab='p(x)',xlab='x')
 for (i in 1:5){
 if (qv[i]< 1) xrg <- sqrt((3-qv[i])/(1-qv[i]))
 else xrg <- 4.5
 vby <- 2*xrg/nn
 xr <- seq(-xrg,xrg,by=2*xrg/nn)
 y0 <- dqgauss(xr,qv[i])
 points (xr,y0,ty='l',col=(i+1))
}
 legend(2, 0.4, legend =c(expression(paste(q==-5)),expression(paste(q==0)),
 expression(paste(q==1.01)),expression(paste(q==2)),expression(paste(q==2.5)),
 expression(paste(q==2.8))),col = c(1,6,5,4,3,2), lty = c(1,1,1,1,1,1))
                          ######
 qv <- 0
 rr <- rqgauss(2^16,qv)
 nn <- 70
 xrg <- sqrt((3-qv)/(1-qv))
 vby <- 2*xrg/(nn)
 xr <- seq(-xrg,xrg,by=vby)
 hist (rr,breaks=xr,freq=FALSE,xlab="x",main='')
 y <- dqgauss(xr)
 lines(xr,y/sum(y*vby),cex=.5,col=2,lty=4)




