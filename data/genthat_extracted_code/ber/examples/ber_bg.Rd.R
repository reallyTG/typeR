library(ber)


### Name: ber_bg
### Title: Batch Effects Removal using Bagging
### Aliases: ber_bg

### ** Examples

Y<-matrix(rnorm(6000),nrow=12)
class<-gl(2,6,labels=c("Control","Treat"))
class<-data.frame(class)
batch<-rep(gl(2,3,labels=c("Batch1","Batch2")),2)
YEadj<-ber_bg(Y,batch,class)



