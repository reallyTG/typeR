library(dad)


### Name: matjeffreyspar
### Title: Matrix of Jeffreys measures (symmetrised Kullback-Leibler
###   divergences) between Gaussian densities
### Aliases: matjeffreyspar

### ** Examples

    data(roses)
    
    # Multivariate:
    X <- roses[,c("Sha","Den","Sym","rose")]
    summary(X)
    mean.X <- as.list(by(X[, 1:3], X$rose, colMeans))
    var.X <- as.list(by(X[, 1:3], X$rose, var))
    matjeffreyspar(mean.X, var.X)

    # Univariate :
    X1 <- roses[,c("Sha","rose")]
    summary(X1)
    mean.X1 <- by(X1$Sha, X1$rose, mean)
    var.X1 <- by(X1$Sha, X1$rose, var)
    matjeffreyspar(mean.X1, var.X1)



