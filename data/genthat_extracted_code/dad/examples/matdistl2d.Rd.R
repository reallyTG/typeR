library(dad)


### Name: matdistl2d
### Title: Matrix of L^2 distances between probability densities
### Aliases: matdistl2d mat.dist.l2d.gs mat.dist.l2d.gs.u mat.dist.l2d.kga
###   mat.dist.l2d.kga.u mat.dist.l2d.kgw mat.dist.l2d.kgw.u

### ** Examples

    data(roses)
    
    # Multivariate:
    X <- as.folder(roses[,c("Sha","Den","Sym","rose")], groups = "rose")
    summary(X)
    mean.X <- mean(X)
    var.X <- var.folder(X)
    
    # Parametrically estimated Gaussian densities:
    matdistl2d(X)
    
    ## Not run: 
##D     # Estimated densities using the Gaussian kernel method ()normal reference rule bandwidth):
##D     matdistl2d(X, method = "kern")   
##D 
##D     # Estimated densities using the Gaussian kernel method (bandwidth provided):
##D     matdistl2d(X, method = "kern", varwL = var.X)
##D     
## End(Not run)

    # Univariate :
    X1 <- as.folder(roses[,c("Sha","rose")], groups = "rose")
    summary(X1)
    mean.X1 <- mean(X1)
    var.X1 <- var.folder(X1)
    
    # Parametrically estimated Gaussian densities:
    matdistl2d(X1)
    
    # Estimated densities using the Gaussian kernel method (normal reference rule bandwidth):
    matdistl2d(X1, method = "kern")
    
    # Estimated densities using the Gaussian kernel method (normal reference rule bandwidth):
    matdistl2d(X1, method = "kern", varwL = var.X1)



