library(Segmentor3IsBack)


### Name: Segmentor3IsBack-package
### Title: Implementation of the Pruned Dynamic Programming Algorithm for
###   the exact optimal segmentation of profiles
### Aliases: Segmentor3IsBack-package Segmentor3IsBack
### Keywords: changepoint segmentation exact counts selection

### ** Examples

N=1000 
x=rnbinom(5*N, size=1.3, prob=rep(c(0.7,0.2,0.01,0.2,0.8),each=N))
res=Segmentor(data=x, model=3, Kmax=20, keep=TRUE);  
# Finds the optimal segmentation in up to 20 segments with respect to 
#the negative binomial model, keeping cost matrix.
Cr<-SelectModel(res, penalty='oracle', keep=FALSE)
Cr
#chooses the number of segments in the segmentation of x, not keeping
# values of constants for slope heuristic.
Best<-BestSegmentation(res, K=Cr, t=2*N)
matplot(Best$bestCost, type='l', lty=2)
points(apply(Best$bestCost,2,which.min),apply(Best$bestCost,2,min),pch=20,col=1:(Cr-1))
apply(Best$bestCost, 2, which.min)
getBreaks(res)[Cr,1:(Cr-1)]
#computes and plots cost of best segmentation in Cr segments with 
#change-point t, and compares result with change-point estimates.
Best$bestSeg
#returns the optimal segmentation in Cr segments with t as a
#change-point



