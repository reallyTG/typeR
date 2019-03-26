library(latentnet)


### Name: predict.ergmm
### Title: Predicted Dyad Values for an ERGMM.
### Aliases: predict.ergmm
### Keywords: distribution graphs models

### ** Examples


## No test: 
data(sampson)
monks.fit<-ergmm(samplike~euclidean(d=2,G=3),tofit="mcmc")
heatmap(predict(monks.fit),Rowv=NA,Colv=NA)
## End(No test)




