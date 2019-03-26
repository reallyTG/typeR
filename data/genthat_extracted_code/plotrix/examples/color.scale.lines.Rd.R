library(plotrix)


### Name: color.scale.lines
### Title: Line segments with scaled colors
### Aliases: color.scale.lines
### Keywords: misc

### ** Examples

 # color a random walk "hot" (red) to "cold" (blue) on its distance
 # from the starting point
 x<-c(0,cumsum(rnorm(99)))
 y<-c(0,cumsum(rnorm(99)))
 xydist<-sqrt(x*x+y*y)
 plot(x,y,main="Random walk plot",xlab="X",ylab="Y",type="n")
 color.scale.lines(x,y,c(1,1,0),0,c(0,1,1),colvar=xydist,lwd=2)
 boxed.labels(x,y,labels=1:100,border=FALSE,cex=0.5)
 # now color the lines to show whether each step went away from
 # or toward the starting position
 color.scale.lines(x,y,col=2+(diff(xydist)>0))
 boxed.labels(x,y,labels=1:100,border=FALSE,cex=0.5)



