library(chemometrics)


### Name: nnetEval
### Title: Neural network evaluation by CV
### Aliases: nnetEval
### Keywords: multivariate

### ** Examples

data(fgl,package="MASS")
grp=fgl$type
X=scale(fgl[,1:9])
k=length(unique(grp))
dat=data.frame(grp,X)
n=nrow(X)
ntrain=round(n*2/3)
require(nnet)
set.seed(123)
train=sample(1:n,ntrain)
resnnet=nnetEval(X,grp,train,decay=c(0,0.01,0.1,0.15,0.2,0.3,0.5,1),
   size=20,maxit=20)



