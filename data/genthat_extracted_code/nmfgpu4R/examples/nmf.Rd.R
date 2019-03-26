library(nmfgpu4R)


### Name: nmf
### Title: Non-negative Matrix Factorization (NMF) on GPU
### Aliases: fitted.nmfgpu nmf nmf.default nmf.formula predict.nmfgpu

### ** Examples

## Not run: 
##D # Initialize the library
##D library(nmfgpu4R)
##D nmfgpu4R.init()
##D 
##D # Create dummy data
##D data <- runif(256*1024)
##D dim(data) <- c(256, 1024)
##D 
##D # Compute several factorization models
##D result <- nmf(data, 128, algorithm="mu", initMethod="K-Means/Random", maxiter=500)
##D result <- nmf(data, 128, algorithm="mu", initMethod="CopyExisting", 
##D                  parameters=list(W=result$W, H=result$H), maxiter=500)
##D result <- nmf(data, 128, algorithm="gdcls", maxiter=500, parameters=list(lambda=0.1))
##D result <- nmf(data, 128, algorithm="als", maxiter=500)
##D result <- nmf(data, 128, algorithm="acls", maxiter=500, 
##D                  parameters=list(lambdaH=0.1, lambdaW=0.1))
##D result <- nmf(data, 128, algorithm="ahcls", maxiter=500, 
##D                  parameters=list(lambdaH=0.1, lambdaW=0.1, alphaH=0.5, alphaW=0.5))
##D result <- nmf(data, 128, algorithm="nsnmf", maxiter=500, parameters=list(theta=0.25))
##D 
##D # Compute encoding matrices for training and test data
##D set.seed(42)
##D idx <- sample(1:nrow(iris), 100, replace=F)
##D data.train <- iris[idx,]
##D data.test <- iris[-idx,]
##D 
##D model.nmf <- nmf(t(data.train[,-5]), 2)
##D encoding.train <- t(predict(model.nmf))
##D encoding.test <- t(predict(model.nmf, t(data.test[,-5])))
##D 
##D plot(encoding.train, col=data.train[,5], pch=1)
##D points(encoding.test, col=data.test[,5], pch=4)
## End(Not run)




