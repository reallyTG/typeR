library(ber)


### Name: ber
### Title: Batch Effects Removal
### Aliases: ber

### ** Examples

Y<-matrix(rnorm(6000),nrow=12)
class<-gl(2,6,labels=c("Control","Treat"))
class<-data.frame(class)
batch<-rep(gl(2,3,labels=c("Batch1","Batch2")),2)
YEadj<-ber(Y,batch,class)



