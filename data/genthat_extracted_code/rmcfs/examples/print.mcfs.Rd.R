library(rmcfs)


### Name: print.mcfs
### Title: Prints mcfs result
### Aliases: print.mcfs

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
##D                   finalCV = FALSE, finalRuleset = TRUE, threadsNumber = 2)
##D 
##D   # Print basic information about mcfs result.
##D   print(result)
##D   
##D   
## End(Not run)###dontrunend



