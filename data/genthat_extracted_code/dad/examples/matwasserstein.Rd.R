library(dad)


### Name: matwasserstein
### Title: Matrix of 2-Wassterstein distance between Gaussian densities
### Aliases: matwasserstein

### ** Examples

    data(roses)
    
    # Multivariate:
    X <- as.folder(roses[,c("Sha","Den","Sym","rose")], groups = "rose")
    summary(X)
    matwasserstein(X)
    
    # Univariate :
    X1 <- as.folder(roses[,c("Sha","rose")], groups = "rose")
    summary(X1)
    matwasserstein(X1)



