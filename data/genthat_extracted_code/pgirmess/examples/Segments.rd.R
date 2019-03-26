library(pgirmess)


### Name: Segments
### Title: Draw line segments between pairs of points.
### Aliases: Segments
### Keywords: hplot

### ** Examples

 mydata<-cbind(rnorm(20),rnorm(20),rnorm(20),rnorm(20))
 plot(range(rbind(mydata[,1],mydata[,3])),range(rbind(mydata[,2],mydata[,4])),
 type="n",xlab="",ylab="")
 Segments(mydata,col=rainbow(20))
 
 myvec<-rnorm(4)
 plot(myvec[c(1,3)],myvec[c(2,4)],type="n",xlab="",ylab="")
 Segments(myvec)
 
 myvec<-rnorm(16)
 plot(myvec,myvec,type="n",xlab="",ylab="")
 Segments(myvec)
  


