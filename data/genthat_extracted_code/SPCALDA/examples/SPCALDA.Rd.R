library(SPCALDA)


### Name: SPCALDA
### Title: A New Reduced-Rank Linear Discriminant Analysis Method
### Aliases: SPCALDA
### Keywords: function

### ** Examples

set.seed(2015)
n = 200;p = 500

X = matrix(rnorm(n*p),n,p)
mu=matrix(0,4,p)
mu[1,1:125]=0.4;mu[2,126:250]=0.4;mu[3,251:375]=0.4;mu[4,376:500]=0.4
Y = rep(1:4,50)

for (g in 1:4) {
        index = which(Y == g)
        n_g = length(index)
        X[index,] = X[index,] + matrix(mu[g,],n_g,p,byrow=TRUE)
}

xtr = X[1:100,]; ytr=Y[1:100] #traning set
xte = X[101:200,]; yte =Y[101:200] # test set
folds = list(1:20,21:40,41:60,61:80,81:100)

spcaldaResult = SPCALDA(X=xtr,Y=ytr,rho=exp(c((-2):6)),K=20, folds = folds)
yhat = predict(spcaldaResult$ob,xte%*%spcaldaResult$tuneRotation)$class
error = sum(yhat != yte) 
 



