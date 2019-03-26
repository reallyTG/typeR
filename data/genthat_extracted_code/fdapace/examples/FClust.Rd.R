library(fdapace)


### Name: FClust
### Title: Functional clustering and identifying substructures of
###   longitudinal data
### Aliases: FClust

### ** Examples

## Not run: 
##D data(medfly25)
##D Flies <- MakeFPCAInputs(medfly25$ID, medfly25$Days, medfly25$nEggs) 
##D newClust <- FClust(Flies$Ly, Flies$Lt, k = 2, optnsFPCA = 
##D                     list(methodMuCovEst = 'smooth', userBwCov = 2, FVEthreshold = 0.90))
##D                     
##D # We denote as 'veryLowCount' the group of flies that lay less
##D # than twenty-five eggs during the 25-day period examined.
##D 
##D veryLowCount = ifelse( sapply( unique(medfly25$ID), function(u) 
##D                    sum( medfly25$nEggs[medfly25$ID == u] )) < 25, 0, 1)
##D N <- length(unique(medfly25$ID))
##D (correctRate <- sum( (1 + veryLowCount) ==  newClust$cluster) / N) # 99.6%
## End(Not run)



