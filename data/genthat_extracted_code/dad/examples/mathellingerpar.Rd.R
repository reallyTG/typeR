library(dad)


### Name: mathellingerpar
### Title: Matrix of Hellinger distances between Gaussian densities given
###   their parameters
### Aliases: mathellingerpar

### ** Examples

    data(roses)
    
    # Multivariate:
    X <- roses[,c("Sha","Den","Sym","rose")]
    summary(X)
    mean.X <- as.list(by(X[, 1:3], X$rose, colMeans))
    var.X <- as.list(by(X[, 1:3], X$rose, var))
    mathellingerpar(mean.X, var.X)

    # Univariate :
    X1 <- roses[,c("Sha","rose")]
    summary(X1)
    mean.X1 <- by(X1$Sha, X1$rose, mean)
    var.X1 <- by(X1$Sha, X1$rose, var)
    mathellingerpar(mean.X1, var.X1)



