library(FRegSigCom)


### Name: cv.sof.spike
### Title: Cross-validation for linear scalar-on-function regression for
###   highly densely observed spiky functional data
### Aliases: cv.sof.spike

### ** Examples



##########################################################################
# Example: scalar-on-function for highly-densely observed curves
##########################################################################


ptm <- proc.time()
library(FRegSigCom)
data(Pork)
X=Pork$X
Y=Pork$Y
ntrain=40 # in paper, we use 80 observations as training data
xtrange=c(0,1) # the range of t in x(t).
t.x.list=list(seq(0,1,length.out=dim(X)[2]))
train.index=sample(1:dim(X)[1], ntrain)
X.train <- X.test <- list()

X.train[[1]]=X[train.index,]
X.test[[1]]=X[-(train.index),]
Y.train <- Y[train.index]
Y.test <- Y[-(train.index)]

fit.cv=cv.sof.spike(X.train, Y.train, t.x.list)
Y.pred=pred.sof.spike(fit.cv, X.test)
pred.error=mean((Y.pred-Y.test)^2)

print(c("pred.error=",pred.error))

print(proc.time()-ptm)





