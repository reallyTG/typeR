library(rmcfs)


### Name: plot.idgraph
### Title: Plots interdependencies graph
### Aliases: plot.idgraph

### ** Examples

  ## Not run: 
##D ###dontrunbegin
##D   
##D   # create input data
##D   adata <- artificial.data(rnd_features = 10)
##D   showme(adata)
##D   
##D   # Parametrize and run MCFS-ID procedure
##D   result <- mcfs(class~., adata, cutoffPermutations = 0, featureFreq = 50,
##D                   finalCV = FALSE, finalRuleset = FALSE, threadsNumber = 2)
##D 
##D   # build interdependencies graph for top 6 features 
##D   # and top 12 interdependencies and plot all nodes
##D   gid <- build.idgraph(result, size = 6, size_ID = 12, orphan_nodes = TRUE)
##D   plot(gid, label_dist = 1)
##D   
##D   
## End(Not run)###dontrunend



