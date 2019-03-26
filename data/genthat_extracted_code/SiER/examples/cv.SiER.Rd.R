library(SiER)


### Name: cv.SiER
### Title: Cross-validation for high-dimensional multivariate regression
### Aliases: cv.SiER

### ** Examples

# q=1
library(MASS)
nvar=100
nvarq <- 1
sigmaY <- 0.1
sigmaX=0.1
nvar.eff=15
rho <- 0.3
Sigma=matrix(0,nvar.eff,nvar.eff)
for(i in 1:nvar.eff){
    for(j in 1:nvar.eff){
        Sigma[i,j]=rho^(abs(i-j))
    }
}

betas.true <- matrix(0, nvar, 1)
betas.true[1:15,1]=rep(1,15)/sqrt(15)

ntest <- 100
ntrain <- 90
ntot <- ntest+ntrain
X <- matrix(0,ntot,nvar)
X[,1:nvar.eff] <- mvrnorm(n=ntot, rep(0, nvar.eff), Sigma)
X[,-(1:nvar.eff)] <- matrix(sigmaX*rnorm((nvar-nvar.eff)*dim(X)[1]),
                            dim(X)[1],(nvar-nvar.eff))
Y <- X%*%betas.true
Y <- Y+rnorm(ntot, 0, sigmaY)

X.train <- X[1:ntrain,]
Y.train <- Y[1:ntrain,]
X.test <- X[-(1:ntrain),]
Y.test <- Y[-(1:ntrain),]

cv.fit <- cv.SiER(X.train,Y.train, K.cv=5)

Y.pred=pred.SiER(cv.fit, X.test)
error=sum((Y.pred-Y.test)^2)/ntest
print(c("predict error=", error))
coefs=getcoef.SiER(cv.fit)

## No test: 
#q>1
library(MASS)
total.noise <- 0.1
rho <- 0.3
rho.e <- 0.2
nvar=500
nvarq <- 3
sigma2 <- total.noise/nvarq
sigmaX=0.1
nvar.eff=150

Sigma=matrix(0,nvar.eff,nvar.eff)
for(i in 1:nvar.eff){
    for(j in 1:nvar.eff){
        Sigma[i,j]=rho^(abs(i-j))
    }
}
Sigma2.y <- matrix(sigma2*rho.e,nvarq, nvarq)
diag(Sigma2.y) <- sigma2

betas.true <- matrix(0, nvar, 3)
betas.true[1:15,1]=rep(1,15)/sqrt(15)
betas.true[16:45,2]=rep(0.5,30)/sqrt(30)
betas.true[46:105,3]=rep(0.25,60)/sqrt(60)

ntest <- 500
ntrain <- 90
ntot <- ntest+ntrain
X <- matrix(0,ntot,nvar)
X[,1:nvar.eff] <- mvrnorm(n=ntot, rep(0, nvar.eff), Sigma)
X[,-(1:nvar.eff)] <- matrix(sigmaX*rnorm((nvar-nvar.eff)*dim(X)[1]),
                           dim(X)[1],(nvar-nvar.eff))
Y <- X%*%betas.true
Y <- Y+mvrnorm(n=ntot, rep(0,nvarq), Sigma2.y)

X.train <- X[1:ntrain,]
Y.train <- Y[1:ntrain,]
X.test <- X[-(1:ntrain),]
Y.test <- Y[-(1:ntrain),]

cv.fit <- cv.SiER(X.train,Y.train, K.cv=5)

Y.pred=pred.SiER(cv.fit, X.test)
error=sum((Y.pred-Y.test)^2)/ntest
print(c("predict error=", error))
## End(No test)



