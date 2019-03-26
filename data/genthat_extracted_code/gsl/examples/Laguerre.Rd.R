library(gsl)


### Name: Laguerre
### Title: Laguerre functions
### Aliases: Laguerre laguerre laguerre_1 laguerre_2 laguerre_3 laguerre_n
### Keywords: array

### ** Examples


x <- seq(from=0,to=6,len=100)
plot(x,laguerre_n(2,0,x),xlim=c(0,6),ylim=c(-2,3),
          type="l",xaxt="n",yaxt="n",bty="n",xlab="",ylab="",
          main="Figure 22.9, p780")

lines(x,laguerre_n(3,0,x))
lines(x,laguerre_n(4,0,x))
lines(x,laguerre_n(5,0,x))
axis(1,pos=0)
axis(2,pos=0)

  


