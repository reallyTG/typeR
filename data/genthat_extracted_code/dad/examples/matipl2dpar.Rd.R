library(dad)


### Name: matipl2dpar
### Title: Matrix of L^2 inner products of Gaussian densities
### Aliases: matipl2dpar mat.ip.l2d.gp mat.ip.l2d.gp.u

### ** Examples

    data(roses)
    
    # Multivariate:
    X <- roses[,c("Sha","Den","Sym","rose")]
    summary(X)
    mean.X <- as.list(by(X[, 1:3], X$rose, colMeans))
    var.X <- as.list(by(X[, 1:3], X$rose, var))
    
    # Gaussian densities, given parameters
    matipl2dpar(mean.X, var.X)

    # Univariate :
    X1 <- roses[,c("Sha","rose")]
    summary(X1)
    mean.X1 <- by(X1$Sha, X1$rose, mean)
    var.X1 <- by(X1$Sha, X1$rose, var)
    
    # Gaussian densities, given parameters
    matipl2dpar(mean.X1, var.X1)



