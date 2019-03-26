library(FRegSigCom)


### Name: cv.msof.hd
### Title: Cross-validation for high dimensional linear multivariate
###   scalar-on-function regression
### Aliases: cv.msof.hd

### ** Examples



#########################################################################
# Example:  
#########################################################################

#toy example

ptm <- proc.time()
library(FRegSigCom)
data(air)
Y=matrix(0, nrow(air[[1]]), 3)
Y[,1]=apply(air[[1]][,1:8],1,mean)
Y[,2]=apply(air[[1]][,(1:8)+8],1,mean)
Y[,3]=apply(air[[1]][,(1:8)+16],1,mean)

X=list()
for(i in 1:(length(air)-1))
{
  X[[i]]=air[[i+1]]
}
 
ntrain=100 # in paper, we use 80 observations as training data
t.x=seq(0,1,length.out=ncol(X[[1]]))
train.index=sample(1:nrow(X[[1]]), ntrain)
X.train <- X.test <- list()
t.x.list=list()
for(i in 1:length(X))
{
  t.x.list[[i]]=t.x
  X.train[[i]]=X[[i]][train.index,]
  X.test[[i]]=X[[i]][-(train.index),]
}
Y.train <- Y[train.index,]
Y.test <- Y[-(train.index),]

fit.cv=cv.msof.hd(X.train, Y.train, t.x.list, upper.comp=5)
# in practice, use the default values (or larger) for
# "upper.comp" and "n.basis".

Y.pred=pred.msof.hd(fit.cv, X.test)
pred.error=mean((Y.pred-Y.test)^2)
print(c("pred.error=",pred.error))

print(proc.time()-ptm)





