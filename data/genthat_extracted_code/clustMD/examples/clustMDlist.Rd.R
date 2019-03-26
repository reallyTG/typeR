library(clustMD)


### Name: clustMDlist
### Title: Model Based Clustering for Mixed Data
### Aliases: clustMDlist

### ** Examples

    data(Byar)

    # Transformation skewed variables
    Byar$Size.of.primary.tumour <- sqrt(Byar$Size.of.primary.tumour)
    Byar$Serum.prostatic.acid.phosphatase <- 
    log(Byar$Serum.prostatic.acid.phosphatase)

    # Order variables (Continuous, ordinal, nominal)
    Y <- as.matrix(Byar[, c(1, 2, 5, 6, 8, 9, 10, 11, 3, 4, 12, 7)])

    # Start categorical variables at 1 rather than 0
    Y[, 9:12] <- Y[, 9:12] + 1

    # Standardise continuous variables
    Y[, 1:8] <- scale(Y[, 1:8])

    # Merge categories of EKG variable for efficiency
    Yekg <- rep(NA, nrow(Y))
    Yekg[Y[,12]==1] <- 1
    Yekg[(Y[,12]==2)|(Y[,12]==3)|(Y[,12]==4)] <- 2
    Yekg[(Y[,12]==5)|(Y[,12]==6)|(Y[,12]==7)] <- 3
    Y[, 12] <- Yekg

    argList <- list(X=Y, G=3, CnsIndx=8, OrdIndx=11, Nnorms=20000,
    MaxIter=500, model="EVI", store.params=FALSE, scale=TRUE, 
    startCL="kmeans", autoStop=FALSE, ma.band=50, stop.tol=NA)

    ## Not run: 
##D     res <- clustMDlist(argList)
##D     
## End(Not run)




