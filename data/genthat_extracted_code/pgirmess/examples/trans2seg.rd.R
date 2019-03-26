library(pgirmess)


### Name: trans2seg
### Title: Convert a transect coordinate file into a matrix with segment
###   coordinates.
### Aliases: trans2seg
### Keywords: utilities

### ** Examples


x<-c(10,NA, NA, NA,56,NA,NA,100)
y<-c(23,NA, NA, NA,32,NA,NA,150)
cols=c("red","blue","blue","blue","red","blue","blue","red")
plot(x,y,col=cols,pch=19)
mysegs<-trans2seg(cbind(x,y))
segments(mysegs[,1],mysegs[,2],mysegs[,3],mysegs[,4])



