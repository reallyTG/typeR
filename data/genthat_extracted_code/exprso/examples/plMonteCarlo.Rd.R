library(exprso)


### Name: plMonteCarlo
### Title: Monte Carlo Cross-Validation
### Aliases: plMonteCarlo

### ** Examples

## Not run: 
##D require(golubEsets)
##D data(Golub_Merge)
##D array <- arrayEset(Golub_Merge, colBy = "ALL.AML", include = list("ALL", "AML"))
##D array <- modFilter(array, 20, 16000, 500, 5) # pre-filter Golub ala Deb 2003
##D array <- modTransform(array) # lg transform
##D array <- modNormalize(array, c(1, 2)) # normalize gene and subject vectors
##D ss <- ctrlSplitSet(func = "splitStratify", percent.include = 67, colBy = NULL)
##D fs <- list(ctrlFeatureSelect(func = "fsStats", top = 0, how = "t.test"),
##D            ctrlFeatureSelect(func = "fsPrcomp", top = 50))
##D gs <- ctrlGridSearch(func = "plGrid", how = "buildSVM", top = c(2, 3, 4), fold = 10,
##D                      kernel = c("linear", "radial"), cost = 10^(-3:3), gamma = 10^(-3:3))
##D boot <- plMonteCarlo(array, B = 3, ctrlSS = ss, ctrlFS = fs, ctrlGS = gs)
## End(Not run)



