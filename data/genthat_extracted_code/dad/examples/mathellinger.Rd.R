library(dad)


### Name: mathellinger
### Title: Matrix of Hellinger distances between Gaussian densities
### Aliases: mathellinger

### ** Examples

    data(roses)
    
    # Multivariate:
    X <- as.folder(roses[,c("Sha","Den","Sym","rose")], groups = "rose")
    summary(X)
    mathellinger(X)
    
    # Univariate :
    X1 <- as.folder(roses[,c("Sha","rose")], groups = "rose")
    summary(X1)
    mathellinger(X1)



