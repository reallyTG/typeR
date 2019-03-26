library(FRegSigCom)


### Name: cv.fof.spike
### Title: Cross-validation for linear function-on-function regression on
###   highly densely observed spiky data
### Aliases: cv.fof.spike

### ** Examples


###########################################################################
# Example: spiky function-on-function regresion
###########################################################################
ptm <- proc.time()
library(FRegSigCom)
library(refund)
data(DTI)
I=which(is.na(apply(DTI$cca,1,mean)))
X=DTI$cca[-I,] # functional response
Y=DTI$rcst[-I,-(1:12)] #functional predictor
t.x <- list(seq(0,1,length=dim(X)[2]))
t.y <- seq(0,1,length=dim(Y)[2])
# randomly split all the observations into a training set with 200 observations
# and a test set.
train.id=sample(1:nrow(Y), 30)
X.train <- list(X[train.id,])
Y.train <- Y[train.id, ]
X.test <- list(X[-(train.id),])
Y.test <- Y[-(train.id), ]
fit.cv=cv.fof.spike(X.train, Y.train, t.x, t.y)
Y.pred=pred.fof.spike(fit.cv, X.test)
error<- mean((Y.pred-Y.test)^2)
print(c("prediction error=", error))

print(proc.time()-ptm)



