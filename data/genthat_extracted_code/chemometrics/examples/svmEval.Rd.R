library(chemometrics)


### Name: svmEval
### Title: Support Vector Machine evaluation by CV
### Aliases: svmEval
### Keywords: multivariate

### ** Examples

data(fgl,package="MASS")
grp=fgl$type
X=scale(fgl[,1:9])
k=length(unique(grp))
dat=data.frame(grp,X)
n=nrow(X)
ntrain=round(n*2/3)
require(e1071)
set.seed(143)
train=sample(1:n,ntrain)
ressvm=svmEval(X,grp,train,gamvec=c(0,0.05,0.1,0.2,0.3,0.5,1,2,5),
  legpos="topright")
title("Support vector machines")



