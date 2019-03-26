library(pscl)


### Name: igamma
### Title: inverse-Gamma distribution
### Aliases: igamma densigamma pigamma qigamma rigamma igammaHDR
### Keywords: distribution

### ** Examples

alpha <- 4
beta <- 30
summary(rigamma(n=1000,alpha,beta))

xseq <- seq(.1,30,by=.1)
fx <- densigamma(xseq,alpha,beta)
plot(xseq,fx,type="n",
     xlab="x",
     ylab="f(x)",
     ylim=c(0,1.01*max(fx)),
     yaxs="i",
     axes=FALSE)
axis(1)
title(substitute(list(alpha==a,beta==b),list(a=alpha,b=beta)))
q <- igammaHDR(alpha,beta,debug=TRUE)
xlo <- which.min(abs(q[1]-xseq))
xup <- which.min(abs(q[2]-xseq))
plotZero <- par()$usr[3]
polygon(x=xseq[c(xlo,xlo:xup,xup:xlo)],
        y=c(plotZero,
          fx[xlo:xup],
          rep(plotZero,length(xlo:xup))),
        border=FALSE,
        col=gray(.45))
lines(xseq,fx,lwd=1.25)


## Not run: 
##D alpha <- beta <- .1
##D xseq <- exp(seq(-7,30,length=1001))
##D fx <- densigamma(xseq,alpha,beta)
##D plot(xseq,fx,
##D      log="xy",
##D      type="l",
##D      ylim=c(min(fx),1.01*max(fx)),
##D      yaxs="i",
##D      xlab="x, log scale",
##D      ylab="f(x), log scale",
##D      axes=FALSE)
##D axis(1)
##D 
##D title(substitute(list(alpha==a,beta==b),list(a=alpha,b=beta)))
##D q <- igammaHDR(alpha,beta,debug=TRUE)
##D xlo <- which.min(abs(q[1]-xseq))
##D xup <- which.min(abs(q[2]-xseq))
##D plotZero <- min(fx)
##D polygon(x=xseq[c(xlo,xlo:xup,xup:xlo)],
##D         y=c(plotZero,
##D           fx[xlo:xup],
##D           rep(plotZero,length(xlo:xup))),
##D         border=FALSE,
##D         col=gray(.45))
##D lines(xseq,fx,lwd=1.25)
## End(Not run)



