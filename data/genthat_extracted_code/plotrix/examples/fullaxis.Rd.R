library(plotrix)


### Name: fullaxis
### Title: Add an axis with a line to the edge of the plot
### Aliases: fullaxis
### Keywords: misc

### ** Examples

 plot(runif(20,-1,1),runif(20,-1,1),xlim=c(-1,1.5),main="Demo of fullaxis",
  xlab="X",ylab="Y",axes=FALSE)
 fullaxis(1,col="red",col.axis="red")
 fullaxis(2,col="blue",col.axis="blue")
 fullaxis(4,at=c(-0.5,0,0.5),labels=c("Negative","Zero","Positive"),pos=1.2,
  col="green",las=1)
 # add a top line to complete the "box"
 xylim<-par("usr")
 segments(xylim[1],xylim[4],xylim[2],xylim[4])



