library(plotrix)


### Name: joyPlot
### Title: Display a series of density curves.
### Aliases: joyPlot
### Keywords: misc

### ** Examples

 x1<-c(sample(20:50,20),sample(40:80,30))
 x2<-c(sample(10:40,30),sample(50:90,30))
 x3<-sample(20:90,50)
 xdens1<-density(x1)
 xdens2<-density(x2)
 xdens3<-density(x3)
 joyPlot(list(xdens1,xdens2,xdens3),main="joyPlot with lines",
  xlab="Position",xlim=c(0,100))
 xlist<-list(first=xdens1,second=xdens2,third=xdens3)
 joyPlot(xlist,main="joyPlot with polygons",xlab="Position",
  fill=c("#ffcccc","#ccffcc","#ccccff"),xlim=c(0,100))
 joyPlot(xlist,main="joyPlot with overlapping polygons",
  fill=c("#ffcccc","#ccffcc","#ccccff"),xlim=c(0,100),
  newrange=c(0,1.5),xlab="Position")



