library(ber)


### Name: combat_p
### Title: parametric combat
### Aliases: combat_p

### ** Examples

Y<-matrix(rnorm(1200),nrow=12)
class<-gl(2,6,labels=c("Control","Treat"))
class<-data.frame(class)
batch<-rep(gl(2,3,labels=c("Batch1","Batch2")),2)
YEadj<-combat_p(Y,batch,class)



