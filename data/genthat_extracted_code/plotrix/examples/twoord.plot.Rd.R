library(plotrix)


### Name: twoord.plot
### Title: Plot with two ordinates
### Aliases: twoord.plot
### Keywords: misc

### ** Examples

 xval1 <- seq.Date(as.Date("2017-01-02"),
  as.Date("2017-01-10"), by="day")
 xval2 <- seq.Date(as.Date("2017-01-01"),
  as.Date("2017-01-15"), by="day")
 going_up<-seq(3,7,by=0.5)+rnorm(9)
 going_down<-rev(60:74)+rnorm(15)
 twoord.plot(2:10,going_up,1:15,going_down,xlab="Sequence",
  ylab="Ascending values",rylab="Descending values",lcol=4,
  main="Plot with two ordinates - points and lines",
  do.first="plot_bg();grid(col=\"white\",lty=1)")
 axis.Date(1,xval2)
 # now separate the lines
 twoord.plot(2:10,going_up,1:15,going_down,xlab="Sequence",
  lylim=range(going_up)+c(-1,10),rylim=range(going_down)+c(-10,2),
  ylab="Ascending values",ylab.at=5,rylab="Descending values",
  rylab.at=65,lcol=4,main="Plot with two ordinates - separated lines",
  lytickpos=3:7,rytickpos=seq(55,75,by=5),
  do.first="plot_bg();grid(col=\"white\",lty=1)")
 twoord.plot(2:10,going_up,1:15,going_down,xlab="Sequence",
  lylim=range(going_up)+c(-1,10),rylim=range(going_down)+c(-10,2),
  type=c("bar","l"),ylab="Ascending values",ylab.at=5,
  rylab="Descending values",rylab.at=65,
  main="Bars on left axis, lines on right axis",
  lytickpos=3:7,rytickpos=seq(55,75,by=5),
  lcol=3,rcol=4,do.first="plot_bg()")
 twoord.plot(2:10,going_up,1:15,going_down,xlab="Sequence",
  lylim=c(-3,8),rylim=c(50,100),type=c("l","bar"),
  ylab="Ascending values",rylab="Descending values",
  lytickpos=3:7,rytickpos=seq(55,75,by=5),ylab.at=5,rylab.at=65,
  main="Lines on left axis, bars on right axis",
  lcol=3,rcol=4,do.first="plot_bg(\"yellow\")")
 # histogram with density curve superimposed
 xhist<-hist(rnorm(100),plot=FALSE)
 xdens<-dnorm(seq(-3,3,by=0.05))
 twoord.plot(xhist$mids,xhist$counts,seq(-3,3,by=0.05),
 xdens,type=c("bar","l"),lcol=4,rcol=2,ylab="Counts",
 rylab="Density",main="Histogram and density curve",
 halfwidth=0.2,lylim=c(0,max(xhist$counts)+1),rylim=c(0,0.45),lwd=2)



