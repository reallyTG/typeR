library(micemd)


### Name: overimpute
### Title: Overimputation diagnostic plot
### Aliases: overimpute
### Keywords: mice

### ** Examples


require(parallel)
nnodes<-detectCores()-1#number of nodes
m<-100#nb generated values per observation

################
#one level data
################
require(mice)
data(nhanes)
#res.mice<-mice.par(nhanes,m = m,nnodes = nnodes)
#res.over<-overimpute(res.mice, nnodes = nnodes)

################
#two level data (time consumming)
################
data(CHEM97Na)

ind.clust<-1#index for the cluster variable

#initialisation of the argument predictorMatrix
temp<-mice(CHEM97Na,m=1,maxit=0)
temp$pred[ind.clust,ind.clust]<-0
temp$pred[-ind.clust,ind.clust]<- -2
predictor.matrix<-temp$pred

#initialisation of the argument method
method<-find.defaultMethod(CHEM97Na,ind.clust)

#multiple imputation by chained equations (time consumming)

#res.mice<-mice.par(CHEM97Na,
#                   predictorMatrix = predictor.matrix,
#                   method=method,m=m,nnodes = nnodes)


#overimputation on 30 individuals
#res.over<-overimpute(res.mice,
#                     nnodes=nnodes,
#                     plotinds=sample(x = seq(nrow(CHEM97Na)),size = 30))




