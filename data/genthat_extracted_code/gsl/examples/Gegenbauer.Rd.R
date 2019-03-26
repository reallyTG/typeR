library(gsl)


### Name: Gegenbauer
### Title: Gegenbauer functions
### Aliases: Gegenbauer gegenbauer gegenpoly_1 gegenpoly_2 gegenpoly_3
###   gegenpoly_n gegenpoly_array
### Keywords: array

### ** Examples


x <- seq(from=-1 ,to=1,len=300)
y <- gegenpoly_array(6,0.5,x)
matplot(x,t(y[-(1:2),]), xlim=c(-1,1.2),ylim=c(-0.5,1.5),
       type="l",xaxt="n",yaxt="n",bty="n",xlab="",ylab="",
       main="Figure 22.5, p777",col="black")
axis(1,pos=0)
axis(2,pos=0)


plot(x, gegenpoly_n(5,lambda=0.2, x,give=FALSE,strict=TRUE),
xlim=c(-1,1),ylim=c(-1.5,1.5),main="Figure 22.5, p777",
type="n",xaxt="n",yaxt="n",bty="n",xlab="",ylab="")
lines(x, gegenpoly_n(5,lambda=0.2, x,give=FALSE,strict=TRUE))
lines(x, gegenpoly_n(5,lambda=0.4, x,give=FALSE,strict=TRUE))
lines(x, gegenpoly_n(5,lambda=0.6, x,give=FALSE,strict=TRUE))
lines(x, gegenpoly_n(5,lambda=0.8, x,give=FALSE,strict=TRUE))
lines(x, gegenpoly_n(5,lambda=1.0, x,give=FALSE,strict=TRUE))
axis(1,pos=0)
axis(2,pos=0,las=1)







