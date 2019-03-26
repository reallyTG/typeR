library(Segmentor3IsBack)


### Name: BestSegmentation
### Title: BestSegmentation
### Aliases: BestSegmentation
### Keywords: R-package PDPA Segmentation

### ** Examples

require(Segmentor3IsBack);
N=2000 
x=rnbinom(3*N,size=1.3,prob=rep(c(0.7,0.2,0.01),each=N));
res=Segmentor(data=x,model=3,Kmax=10, keep=TRUE);  
# Finds the optimal segmentation in up to 10 segments with respect to 
#the negative binomial model.
K<-3
Best<-BestSegmentation(res,K=3,t=3000,compress=FALSE)
matplot(Best$bestCost, type='l', lty=2)
points(apply(Best$bestCost,2,which.min),apply(Best$bestCost,2,min),pch=20,col=1:(K-1))
apply(Best$bestCost, 2,which.min)
getBreaks(res)[K,1:(K-1)]
#computes and plots cost of best segmentation in 3 segments with 
#change-point t, and compares result with change-point estimates.
Best$bestSeg
#returns the optimal segmentation in 3 segments with 3000 as a
#change-point
Best<-BestSegmentation(res,K=3,t=3000,compress=TRUE)
Best$bestSeg
# this segmentation usually does not make sense because of the
# compress option. t has to be adapted consequently



