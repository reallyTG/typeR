library(ber)


### Name: combat_np
### Title: non-parametric combat
### Aliases: combat_np

### ** Examples

Y<-matrix(rnorm(1200),nrow=12)
class<-gl(2,6,labels=c("Control","Treat"))
class<-data.frame(class)
batch<-rep(gl(2,3,labels=c("Batch1","Batch2")),2)
YEadj<-combat_np(Y,batch,class)



