context("man.build.idgraph")

##################################################################
test_that("man build.idgraph", {
  options(java.parameters = "-Xmx4g")
  require(testthat)
  require(rmcfs)
  
  # create input data
  adata <- artificial.data(rnd_features = 10)
  showme(adata)
  
  # Parametrize and run MCFS-ID procedure
  result <- mcfs(class~., adata, cutoffPermutations = 0, featureFreq = 50,
                 buildID = TRUE, finalCV = FALSE, finalRuleset = FALSE,
                 threadsNumber = 2)
  
  # build interdependencies graph for top 6 features 
  # and top 12 interdependencies and plot all nodes
  gid <- build.idgraph(result, size = 6, size_ID = 12, orphan_nodes = TRUE)
  plot(gid, label_dist = 1)
  
  # Export graph to graphML (XML structure)
  path <- tempdir()
  igraph::write.graph(gid, file = file.path(path, "artificial.graphml"), 
                      format = "graphml", prefixAttr = FALSE)
  
})

##################################################################
