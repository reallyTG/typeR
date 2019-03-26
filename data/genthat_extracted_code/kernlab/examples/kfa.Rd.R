library(kernlab)


### Name: kfa
### Title: Kernel Feature Analysis
### Aliases: kfa kfa,formula-method kfa,matrix-method show,kfa-method
###   coef,kfa-method
### Keywords: cluster

### ** Examples

data(promotergene)
f <- kfa(~.,data=promotergene,features=2,kernel="rbfdot",
         kpar=list(sigma=0.01))
plot(predict(f,promotergene),col=as.numeric(promotergene[,1]))



