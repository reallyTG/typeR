library(plsgenomics)


### Name: spls
### Title: Adaptive Sparse Partial Least Squares (SPLS) regression
### Aliases: spls

### ** Examples

### load plsgenomics library
library(plsgenomics)

### generating data
n <- 100
p <- 100
sample1 <- sample.cont(n=n, p=p, kstar=10, lstar=2, beta.min=0.25, 
                       beta.max=0.75, mean.H=0.2, sigma.H=10, 
                       sigma.F=5, sigma.E=5)
X <- sample1$X
Y <- sample1$Y
### splitting between learning and testing set
index.train <- sort(sample(1:n, size=round(0.7*n)))
index.test <- (1:n)[-index.train]
Xtrain <- X[index.train,]
Ytrain <- Y[index.train,]
Xtest <- X[index.test,]
Ytest <- Y[index.test,]

### fitting the model, and predicting new observations
model1 <- spls(Xtrain=Xtrain, Ytrain=Ytrain, lambda.l1=0.5, ncomp=2, 
               weight.mat=NULL, Xtest=Xtest, adapt=TRUE, center.X=TRUE, 
               center.Y=TRUE, scale.X=TRUE, scale.Y=TRUE, 
               weighted.center=FALSE)

str(model1)

### plotting the estimation versus real values for the non centered response
plot(model1$Ytrain, model1$hatY.nc, 
     xlab="real Ytrain", ylab="Ytrain estimates")
points(-1000:1000,-1000:1000, type="l")

### plotting residuals versus centered response values
plot(model1$sYtrain, model1$residuals, xlab="sYtrain", ylab="residuals")

### plotting the predictor coefficients
plot(model1$betahat.nc, xlab="variable index", ylab="coeff")

### mean squares error of prediction on test sample
sYtest <- as.matrix(scale(Ytest, center=model1$meanYtrain, scale=model1$sigmaYtrain))
sum((model1$hatYtest - sYtest)^2) / length(index.test)

### plotting predicted values versus non centered real response values 
## on the test set
plot(model1$hatYtest, sYtest, xlab="real Ytest", ylab="predicted values")
points(-1000:1000,-1000:1000, type="l")




