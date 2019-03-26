library(plotrix)


### Name: plotCI
### Title: Plot confidence intervals/error bars
### Aliases: plotCI
### Keywords: hplot

### ** Examples

 y<-runif(10)
 err<-runif(10)
 plotCI(1:10,y,err,main="Basic plotCI")
 plotCI(1:10,y,err,2*err,lwd=2,col="red",scol="blue",
  main="Add colors to the points and error bars")
 err.x<-runif(10)
 err.y<-runif(10)
 plotCI(1:10,y,err.y,pt.bg=par("bg"),pch=21,xlim=c(0,11),
  main="plotCI with extra space on the x axis")
 plotCI(1:10,y,err.x,pt.bg=par("bg"),pch=21,err="x",add=TRUE)
 mtext("for adding horizontal error bars",3,0.5)
 data(warpbreaks)
 attach(warpbreaks)
 wmeans<-by(breaks,tension,mean)
 wsd<-by(breaks,tension,sd)
 ## note that barplot() returns the midpoints of the bars, which plotCI
 ##  uses as x-coordinates
 plotCI(barplot(wmeans,col="gray",ylim=c(0,max(wmeans+wsd))),wmeans,wsd,add=TRUE)
 ## using labels instead of points
 labs<-sample(LETTERS,replace=TRUE,size=10)
 plotCI(1:10,y,err,pch=NA,gap=0.02,main="plotCI with labels at points")
 text(1:10,y,labs)



