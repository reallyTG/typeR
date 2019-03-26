library(dad)


### Name: matjeffreys
### Title: Matrix of Jeffreys measures (symmetrised Kullback-Leibler
###   divergences) between Gaussian densities
### Aliases: matjeffreys

### ** Examples

    data(roses)
    
    # Multivariate:
    X <- as.folder(roses[,c("Sha","Den","Sym","rose")], groups = "rose")
    summary(X)
    matjeffreys(X)
    
    # Univariate :
    X1 <- as.folder(roses[,c("Sha","rose")], groups = "rose")
    summary(X1)
    matjeffreys(X1)



