library(FRegSigCom)


### Name: cv.msof
### Title: Cross-validation for linear multivariate scalar-on-function
###   regression
### Aliases: cv.msof

### ** Examples


#########################################################################
# Example: multiple scalar-on-function regression
#########################################################################


ptm <- proc.time()
library(FRegSigCom)
data(corn)
X=corn$X
Y=corn$Y
ntrain=60 # in paper, we use 80 observations as training data
xtrange=c(0,1) # the range of t in x(t).
t.x.list=list(seq(0,1,length.out=ncol(X)))
train.index=sample(1:nrow(X), ntrain)
X.train <- X.test <- list()
X.train[[1]]=X[train.index,]
X.test[[1]]=X[-(train.index),]
Y.train <- Y[train.index,]
Y.test <- Y[-(train.index),]

fit.cv.1=cv.msof(X.train, Y.train, t.x.list)# the cv procedure for our method
Y.pred=pred.msof(fit.cv.1, X.test) # make prediction on the test data

pred.error=mean((Y.pred-Y.test)^2)
print(c("pred.error=",pred.error))

print(proc.time()-ptm)




