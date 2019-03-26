library(FRegSigCom)


### Name: cv.nonlinear
### Title: Cross-validation for nonlinear function-on-function regression
### Aliases: cv.nonlinear

### ** Examples


#################################################################################
# Example: Nonlinear function-on-function model
###############################################################################

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
X.train.list <- list(X[train.id,])
Y.train <- Y[train.id, ]
X.test.list <- list(X[-(train.id),])
Y.test <- Y[-(train.id), ]
fit.cv=cv.nonlinear(X.train.list, Y.train, t.x, t.y, upper.comp=3,
s.n.basis=20, x.n.basis=20,t.n.basis=20) 
           # in practice, use the default values (or larger) for
           # "upper.comp", "s.n.basis","x.n.basis", and "t.n.basis".
Y.pred=pred.nonlinear(fit.cv, X.test.list)
nonlinear.error= mean((Y.pred-Y.test)^2)
print(c("prediction error=",nonlinear.error))
print(proc.time()-ptm)



