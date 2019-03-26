library(FRegSigCom)


### Name: cv.fof.wv
### Title: Cross-validation for wavelet-based linear function-on-function
###   regression method
### Aliases: cv.fof.wv

### ** Examples


########################################################################
## Example: wavelet function-on-function regresion
#########################################################################
ptm <- proc.time()
library(FRegSigCom)
library(wavethresh)
library(refund)
data(DTI)

I=which(is.na(apply(DTI$cca,1,mean)))
Y=DTI$cca[-I,] # functional response
X=DTI$rcst[-I,21:52] #functional predictor
n.wv=5

diagmat <- diag(2^n.wv)
W.x <- diagmat
for(i in 1:2^n.wv){
  tmp <- wd(diagmat[i,])
  tmp.cof <- accessC(tmp, level=0)
  for(j in 0:(n.wv-1))
    tmp.cof <- c(tmp.cof, accessD(tmp, level=j))
  W.x[,i] <- tmp.cof
}
X.wv=X

t.y <- seq(0,1,length=dim(Y)[2])
# randomly split all the observations into a training set with 200 observations
# and a test set.
train.id=sample(1:nrow(Y), 50)
X.wv.train <- X.wv[train.id,]
Y.train <- Y[train.id, ]
X.wv.test <- X.wv[-(train.id),]
Y.test <- Y[-(train.id), ]

fit.cv=cv.fof.wv(X.wv.train, Y.train, t.y, upp.comp=5) # use default upp.comp or larger
Y.pred=pred.fof.wv(fit.cv, X.wv.test)
error<- mean((Y.pred-Y.test)^2)
print(c(" prediction error=", error))
print(proc.time()-ptm)




