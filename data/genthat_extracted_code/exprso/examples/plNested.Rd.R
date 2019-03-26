library(exprso)


### Name: plNested
### Title: Nested Cross-Validation
### Aliases: plNested

### ** Examples

## Not run: 
##D require(golubEsets)
##D data(Golub_Merge)
##D array <- arrayEset(Golub_Merge, colBy = "ALL.AML", include = list("ALL", "AML"))
##D array <- modFilter(array, 20, 16000, 500, 5) # pre-filter Golub ala Deb 2003
##D array <- modTransform(array) # lg transform
##D array <- modNormalize(array, c(1, 2)) # normalize gene and subject vectors
##D fs <- ctrlFeatureSelect(func = "fsEbayes", top = 0)
##D gs <- ctrlGridSearch(func = "plGrid", how = "buildANN", top = c(10, 20, 30),
##D                      size = 1:3, decay = c(0, .5, 1), fold = 0)
##D nest <- plNested(arrays[[1]], fold = 10, ctrlFS = fs, ctrlGS = gs, save = FALSE)
## End(Not run)



