library(plotrix)


### Name: weighted.hist
### Title: Display a weighted histogram
### Aliases: weighted.hist
### Keywords: misc

### ** Examples

 testx<-sample(1:10,300,TRUE)
 testw<-seq(1,4,by=0.01)
 weighted.hist(testx,testw,breaks=1:10,main="Test weighted histogram")



