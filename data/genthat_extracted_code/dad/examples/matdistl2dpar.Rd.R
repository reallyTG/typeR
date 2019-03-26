library(dad)


### Name: matdistl2dpar
### Title: Matrix of L^2 distances between Gaussian densities given their
###   parameters
### Aliases: matdistl2dpar mat.dist.l2d.gp mat.dist.l2d.gp.u

### ** Examples

    data(roses)
    
    # Multivariate:
    X <- roses[,c("Sha","Den","Sym","rose")]
    summary(X)
    mean.X <- as.list(by(X[, 1:3], X$rose, colMeans))
    var.X <- as.list(by(X[, 1:3], X$rose, var))
    
    # Gaussian densities, given parameters
    matdistl2dpar(mean.X, var.X)

    # Univariate :
    X1 <- roses[,c("Sha","rose")]
    summary(X1)
    mean.X1 <- by(X1$Sha, X1$rose, mean)
    var.X1 <- by(X1$Sha, X1$rose, var)
    
    # Gaussian densities, given parameters
    matdistl2dpar(mean.X1, var.X1)



