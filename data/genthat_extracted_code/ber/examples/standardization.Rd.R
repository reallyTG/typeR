library(ber)


### Name: standardization
### Title: standardization
### Aliases: standardization

### ** Examples

Y<-matrix(rnorm(6000),nrow=12)
batch<-rep(gl(2,3,labels=c("Batch1","Batch2")),2)
YEadj<-standardization(Y,batch)



