library(fasterElasticNet)


### Name: elasticnet
### Title: A fast way fitting elastic net using RcppArmadillo
### Aliases: elasticnet

### ** Examples

    #Use R built-in datasets mtcars for a model fitting
    x <- as.matrix(mtcars[,-1])
    y <- as.matrix(mtcars[, 1])

    XTX <- t(x) %*% x
    XTY <- t(x) %*% y

    #Prints the output of elastic net model with lambda2 = 0
    res <- elasticnet(XTX,XTY,lam2 = 0)



