library(rmcfs)


### Name: export.result
### Title: Saves MCFS-ID result into set csv files
### Aliases: export.result

### ** Examples

  ## Not run: 
##D ###dontrunbegin
##D   
##D   # create input data
##D   adata <- artificial.data(rnd_features = 10)
##D   showme(adata)
##D   
##D   # Parametrize and run MCFS-ID procedure
##D   result <- mcfs(class~., adata, cutoffPermutations = 0, featureFreq = 10,
##D                   finalCV = FALSE, finalRuleset = FALSE, threadsNumber = 2)
##D 
##D   # Export and import R result to/from files
##D   path <- tempdir()
##D   export.result(result, path = path, label = "artificial")
##D   result <- import.result(path = path, label = "artificial")
##D   
##D   
## End(Not run)###dontrunend



