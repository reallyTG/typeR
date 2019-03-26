library(msma)


### Name: msma
### Title: Multiblock Sparse Multivariable Analysis
### Aliases: msma msma.default print.msma

### ** Examples

##### data #####
tmpdata = simdata(n = 50, rho = 0.8, Yps = c(10, 12, 15), Xps = 20, seed=1)
X = tmpdata$X; Y = tmpdata$Y 

##### One Component #####
fit1 = msma(X, Y, comp=1, lambdaX=2, lambdaY=1:3)
fit1

##### Two Component #####
fit2 = msma(X, Y, comp=2, lambdaX=2, lambdaY=1:3)
fit2

##### Matrix data #####
sigma = matrix(0.8, 10, 10)
diag(sigma) = 1
X2 = rmvnorm(50, rep(0, 10), sigma)
Y2 = rmvnorm(50, rep(0, 10), sigma)

fit3 = msma(X2, Y2, comp=1, lambdaX=2, lambdaY=2)
fit3

##### Sparse Principal Component Analysis #####
fit5 = msma(X2, comp=5, lambdaX=2.5)
summary(fit5)




