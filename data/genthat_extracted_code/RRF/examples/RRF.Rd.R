library(RRF)


### Name: RRF
### Title: Feature Selection with Regularized Random Forest
### Aliases: RRF RRF.formula RRF.default print.RRF

### ** Examples

#-----Example 1 -----
library(RRF);set.seed(1)

#only the first feature and last feature are truly useful
X <- matrix(runif(50*50), ncol=50)
class <- (X[,1])^2 + (X[,50])^2  
class[class>median(class)] <- 1;
class[class<=median(class)] <- 0

#ordinary random forest. 
rf <- RRF(X,as.factor(class), flagReg = 0)
impRF <- rf$importance
impRF <- impRF[,"MeanDecreaseGini"]
rf$feaSet

#regularized random forest
rrf <- RRF(X,as.factor(class), flagReg = 1)
rrf$feaSet

#guided regularized random forest
imp <- impRF/(max(impRF))#normalize the importance score
gamma <- 0.5
coefReg <- (1-gamma)+gamma*imp #weighted average
grrf <- RRF(X,as.factor(class),coefReg=coefReg, flagReg=1)
grrf$feaSet

#guided random forest
gamma <- 1
coefReg <- (1-gamma)+gamma*imp 
grf <- RRF(X,as.factor(class),coefReg=coefReg, flagReg=0)
grf$feaSet

#-----Example 2 XOR learning-----
#only the first 3 features are needed
#and each individual feature is not useful
#bSample <- sample(0:1,20000,replace=TRUE)
#X <- matrix(bSample,ncol=40)
#class <- xor(xor(X[,1],X[,2]),X[,3])



