library(HotDeckImputation)


### Name: reweight.data
### Title: Reweight Variables
### Aliases: reweight.data
### Keywords: manip

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)

#Generate matrix of random integers
Y<-matrix(sample(0:9,replace=TRUE,size=6*3),nrow=6)

#choose variable variances
Weights<-1/apply(X=Y,MARGIN=2,FUN=var)

#reweight data for faster Euclidean distance calculation
reweight.data(DATA = Y, weights = Weights, minkovski_factor = 2)



