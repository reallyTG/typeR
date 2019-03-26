library(rmcfs)


### Name: prune.data
### Title: Filters input data
### Aliases: prune.data

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
##D   head(prune.data(adata, result, size = result$cutoff_value))
##D 
##D   
## End(Not run)###dontrunend  



