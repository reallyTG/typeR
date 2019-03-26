library(clustMD)


### Name: clustMDparallel
### Title: Run multiple clustMD models in parallel
### Aliases: clustMDparallel

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

    ## Not run: 
##D     res <- clustMDparallel(X = Y, G = 1:3, CnsIndx = 8, OrdIndx = 11, Nnorms = 20000,
##D     MaxIter = 500, models = c("EVI", "EII", "VII"), store.params = FALSE, scale = TRUE, 
##D     startCL = "kmeans", autoStop= TRUE, ma.band=30, stop.tol=0.0001)
##D   
##D     res$BICarray
## End(Not run)




