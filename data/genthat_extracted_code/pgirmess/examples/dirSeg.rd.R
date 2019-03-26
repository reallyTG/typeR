library(pgirmess)


### Name: dirSeg
### Title: Computes segment directions.
### Aliases: dirSeg
### Keywords: spatial

### ** Examples


x2<-rnorm(10)
y2<-rnorm(10)
mydata<-cbind(0,0,x2,y2)
dirs<-dirSeg(mydata)
dirs

plot(range(mydata[,c(1,3)]),range(mydata[,c(2,4)]),type="n")
Segments(mydata)
text(mydata[,3],mydata[,4],paste(round(dirs,0),"\u00b0"),cex=0.7)
  


