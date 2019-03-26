library(dad)


### Name: matipl2d
### Title: Matrix of L^2 inner products of probability densities
### Aliases: matipl2d mat.ip.l2d.gs mat.ip.l2d.gs.u mat.ip.l2d.kga
###   mat.ip.l2d.kga.u mat.ip.l2d.kgw mat.ip.l2d.kgw.u

### ** Examples

    data(roses)
    
    # Multivariate:
    X <- as.folder(roses[,c("Sha","Den","Sym","rose")], groups = "rose")
    summary(X)
    mean.X <- mean(X)
    var.X <- var.folder(X)
    
    # Parametrically estimated Gaussian densities:
    matipl2d(X)
    
    # Estimated densities using the Gaussian kernel method (normal reference rule bandwidth):
    matipl2d(X, method  = "kern")
    
    # Estimated densities using the Gaussian kernel method (bandwidth provided):
    matipl2d(X, method  = "kern", varwL = var.X)
    
    # Univariate :
    X1 <- as.folder(roses[,c("Sha","rose")], groups = "rose")
    summary(X1)
    mean.X1 <- mean(X1)
    var.X1 <- var.folder(X1)
    
    # Parametrically estimated Gaussian densities:
    matipl2d(X1)
    
    # Estimated densities using the Gaussian kernel method (normal reference rule bandwidth):
    matipl2d(X1, method = "kern")
    
    # Estimated densities using the Gaussian kernel method (bandwidth provided):
    matipl2d(X1, method = "kern", varwL = var.X1)



