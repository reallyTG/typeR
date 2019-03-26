library(plotrix)


### Name: stackpoly
### Title: Display the columns of a matrix or data frame as stacked
###   polygons
### Aliases: stackpoly
### Keywords: misc

### ** Examples

 testx<-matrix(abs(rnorm(100)),nrow=10)
 stackpoly(matrix(cumsum(testx),nrow=10),main="Test Stackpoly I",
  xaxlab=c("One","Two","Three","Four","Five",
  "Six","Seven","Eight","Nine","Ten"),border="black",staxx=TRUE)
 stackpoly(testx,main="Test Stackpoly II",
  xaxlab=c("One","Two","Three","Four","Five",
  "Six","Seven","Eight","Nine","Ten"),border="black",
  staxx=TRUE,stack=TRUE)
 layout(matrix(1:2,nrow=1))
 oldmar<-par(mar=c(5,4,4,0))
 stackpoly(rev(sort(testx-mean(testx))),
  main="Waterfall Plot (x-mean)",xat=seq(10,90,by=10),
  xlab="Index",ylab="Value",lwd=3,col="green",border="black",
  axis4=FALSE)
 ylim<-par("usr")[3:4]
 par(mar=c(5,0,4,4))
 stackpoly(rev(sort((testx-mean(testx))/sd(as.vector(testx)))),
  ylim=ylim,main="Waterfall Plot ((x-mean)/sd)",xat=seq(10,90,by=10),
  xlab="Index",lwd=3,col="lightblue",border="black",axis2=FALSE)
 par(oldmar)



