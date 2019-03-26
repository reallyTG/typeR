library(msma)


### Name: regparasearch
### Title: Regularized Parameters Search
### Aliases: regparasearch print.regparasearch

### ** Examples

##### data #####
tmpdata = simdata(n = 50, rho = 0.8, Yps = c(10, 12, 15), Xps = 20, seed=1)
X = tmpdata$X; Y = tmpdata$Y 

##### Regularized parameters search #####
opt1 = regparasearch(X, Y, comp=1, nfold=5, maxrep=2)
opt1
fit4 = msma(X, Y, comp=1, lambdaX=opt1$optlambdaX, lambdaY=opt1$optlambdaY)
fit4
summary(fit4)

##### Restrict search range #####
opt2 = regparasearch(X, Y, comp=1, nfold=5, maxrep=2, minpct=0.5)
opt2




