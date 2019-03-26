library(fanplot)


### Name: dsplitnorm
### Title: The Split Normal Distribution (or 2 Piece Normal Distribution).
### Aliases: dsplitnorm psplitnorm qsplitnorm rsplitnorm

### ** Examples

x<-seq(-5,5,length=110)
plot(x,dsplitnorm(x),type="l")

#compare to normal density
lines(x,dnorm(x), lty=2, col="red", lwd=5)

#add positive skew
lines(x,dsplitnorm(x, mode=0, sd=1, skew=0.8))

#add negative skew
lines(x,dsplitnorm(x, mode=0, sd=1, skew=-0.5))

#add left and right hand sd
lines(x,dsplitnorm(x, mode=0, sd1=1, sd2=2), col="blue")

#psplitnorm
x<-seq(-5,5,length=100)
plot(x,pnorm(x),type="l")
lines(x, psplitnorm(x, skew=-0.9), col="red")

#qsplitnorm
x<-seq(0,1,length=100)
plot(qnorm(x),type="l",x)
lines(qsplitnorm(x), x, lty=2, col="blue")
lines(qsplitnorm(x, skew=-0.3), x, col="red")

#rsplitnorm
hist(rsplitnorm(n=10000, mode=1, sd=1, skew=0.9),100)



