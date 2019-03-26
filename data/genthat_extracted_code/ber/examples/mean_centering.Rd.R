library(ber)


### Name: mean_centering
### Title: mean_centering
### Aliases: mean_centering

### ** Examples

Y<-matrix(rnorm(6000),nrow=12)
batch<-rep(gl(2,3,labels=c("Batch1","Batch2")),2)
YEadj<-mean_centering(Y,batch)



