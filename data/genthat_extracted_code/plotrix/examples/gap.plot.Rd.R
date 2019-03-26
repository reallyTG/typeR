library(plotrix)


### Name: gap.plot
### Title: Display a plot with one or two gaps (missing ranges) on one axis
### Aliases: gap.plot
### Keywords: misc

### ** Examples

 twogrp<-c(rnorm(5)+4,rnorm(5)+20,rnorm(5)+5,rnorm(5)+22)
 gpcol<-c(2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5)
 gap.plot(twogrp,gap=c(8,16),xlab="Index",ylab="Group values",
  main="Gap on Y axis",col=gpcol)
 gap.plot(twogrp,rnorm(20),gap=c(8,16),gap.axis="x",xlab="X values",
  xtics=c(4,7,17,20),ylab="Y values",main="Gap on X axis with added lines")
 gap.plot(c(seq(3.5,7.5,by=0.5),seq(16.5,22.5,by=0.5)),
  rnorm(22),gap=c(8,16),gap.axis="x",type="l",add=TRUE,col=2,)
 gap.plot(twogrp,gap=c(8,16,25,35),
 xlab="X values",ylab="Y values",xlim=c(1,30),ylim=c(0,42),
 main="Test two gap plot with the lot",xtics=seq(0,30,by=5),
 ytics=c(4,6,18,20,22,38,40,42),
 lty=c(rep(1,10),rep(2,10)),
 pch=c(rep(2,10),rep(3,10)),
 col=c(rep(2,10),rep(3,10)),
 type="b")
 gap.plot(21:30,rnorm(10)+40,gap=c(8,16,25,35),add=TRUE,
  lty=rep(3,10),col=rep(4,10),type="l")



