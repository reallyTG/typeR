library(gsl)


### Name: Expint
### Title: exponential functions
### Aliases: Expint expint expint_E1 expint_E2 expint_En expint_Ei Shi Chi
###   expint_3 Si Ci atanint
### Keywords: array

### ** Examples

x <- seq(from=0.5, to=1, by=0.01)
cbind(x,Si(x),Ci(x),expint_Ei(x),expint_E1(x))  #table 5.1 of AS, p239

x <- seq(from=0, to=12, len=100)
plot(x,Ci(x),col="black",type="l",xaxt="n",yaxt="n",bty="n",
         xlab="",ylab="",main="Figure 5.6, p232",
         xlim=c(0,12),ylim=c(-1,2.0))
lines(x,Si(x))
axis(1,pos=0)
axis(2,pos=0)
 abline(h=pi/2,lty=2)


# Table 5.4, page 245:
 xvec <- seq(from=0,by=0.01,len=20)
 nvec <- c(2,3,4,10,20)
 x <- kronecker(xvec,t(rep(1,5)))
 n <- kronecker(t(nvec),rep(1,20))
 ans <- cbind(x=xvec,expint_En(n,x))
 rownames(ans) <- rep(" ",length(xvec))
 colnames(ans) <- c("x",paste("n=",nvec,sep=""))
 class(ans) <- "I do not understand the first column"

 ans




