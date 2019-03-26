library(rmcfs)


### Name: build.idgraph
### Title: Constructs interdependencies graph
### Aliases: build.idgraph

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
##D                   buildID = TRUE, finalCV = FALSE, finalRuleset = FALSE,
##D                   threadsNumber = 2)
##D 
##D   # build interdependencies graph for top 6 features 
##D   # and top 12 interdependencies and plot all nodes
##D   gid <- build.idgraph(result, size = 6, size_ID = 12, orphan_nodes = TRUE)
##D   plot(gid, label_dist = 1)
##D 
##D   # Export graph to graphML (XML structure)
##D   path <- tempdir()
##D   igraph::write.graph(gid, file = file.path(path, "artificial.graphml"), 
##D             format = "graphml", prefixAttr = FALSE)
##D 
##D   
## End(Not run)###dontrunend



