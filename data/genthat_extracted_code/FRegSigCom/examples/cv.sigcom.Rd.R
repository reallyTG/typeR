library(FRegSigCom)


### Name: cv.sigcom
### Title: Cross-validation for linear function-on-function regression
### Aliases: cv.sigcom

### ** Examples

#########################################################################
# Example 1: linear function-on-function regresion with one predictor
#             curve and two scalar predictors
#########################################################################
ptm <- proc.time()
library(FRegSigCom)
library(refund)
data(DTI)
tmp=1*(DTI$sex=="male")
Z.0=cbind(DTI$case, tmp)

I=which(is.na(apply(DTI$cca,1,mean)))
Y=DTI$cca[-I,] # functional response
X=list(DTI$rcst[-I,-(1:12)]) #functional predictor
Z=Z.0[-I,] # scalar predictor

t.x <- list(seq(0,1,length=dim(X[[1]])[2]))
t.y <- seq(0,1,length=dim(Y)[2])
# randomly split all the observations into a training set with 200 observations
# and a test set.
train.id=sample(1:nrow(Y), 100)
X.train <- list(X[[1]][train.id,])
Y.train <- Y[train.id, ]
Z.train <- Z[train.id, ]
X.test <- list(X[[1]][-(train.id),])
Y.test <- Y[-(train.id), ]
Z.test <- Z[-(train.id), ]
fit.cv=cv.sigcom(X.train, Y.train, t.x, t.y, Z=Z.train)
Y.pred=pred.sigcom(fit.cv, X.test, Z.test=Z.test)
error<- mean((Y.pred-Y.test)^2)
print(c(" prediction error=", error))
coef.est.list=getcoef.sigcom(fit.cv)
mu.est=coef.est.list[[1]] # intercept curve
beta.est=coef.est.list[[2]] # coefficient functions of functional predictors
gamma.est=coef.est.list[[3]] # coefficient functions of scalar predictors
print(proc.time()-ptm)



#########################################################################
# Example 2: linear function-on-function regresion with four predictor curves
#########################################################################


ptm <- proc.time()
library(FRegSigCom)
data(ocean)
Y=ocean[[1]]
Y.train=Y[1:80,]
Y.test=Y[-(1:80),]
t.y=seq(0,1, length.out = ncol(Y))
X.list=list()
X.train.list=list()
X.test.list=list()
t.x.list=list()
for(i in 1:4)
{
  X.list[[i]]=ocean[[i+1]]
  X.train.list[[i]]=X.list[[i]][1:80,]
  X.test.list[[i]]=X.list[[i]][-(1:80),]
  t.x.list[[i]]=seq(0,1, length.out = ncol(X.list[[i]]))
}
fit.cv=cv.sigcom(X.train.list, Y.train, t.x.list, t.y)
Y.pred=pred.sigcom(fit.cv, X.test.list)
error<- mean((Y.pred-Y.test)^2)
print(c(" prediction error=", error))
coef.list=getcoef.sigcom(fit.cv)
mu.est=coef.list[[1]] # intercept curve
beta.est=coef.list[[2]] # coefficient functions of functional predictors
print(proc.time()-ptm)



