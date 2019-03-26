library(chemometrics)


### Name: treeEval
### Title: Classification tree evaluation by CV
### Aliases: treeEval
### Keywords: multivariate

### ** Examples

data(fgl,package="MASS")
grp=fgl$type
X=scale(fgl[,1:9])
k=length(unique(grp))
dat=data.frame(grp,X)
n=nrow(X)
ntrain=round(n*2/3)
require(rpart)
set.seed(123)
train=sample(1:n,ntrain)
par(mar=c(4,4,3,1))
restree=treeEval(X,grp,train,cp=c(0.01,0.02:0.05,0.1,0.15,0.2:0.5,1))
title("Classification trees")




