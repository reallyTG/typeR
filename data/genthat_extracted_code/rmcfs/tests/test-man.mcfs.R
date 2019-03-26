context("man.mcfs")

##################################################################
test_that("man mcfs artificial", {
  options(java.parameters = "-Xmx4g")
  require(testthat)
  require(rmcfs)
  
  # create input data and review it
  adata <- artificial.data(rnd_features = 10)
  showme(adata)
  
  # Parametrize and run MCFS-ID procedure
  result <- mcfs(class~., adata, cutoffPermutations = 3, featureFreq = 50,
                 buildID = TRUE, finalCV = FALSE, finalRuleset = FALSE, 
                 threadsNumber = 2)
  
  # Print basic information about mcfs result
  print(result)
  
  # Review cutoff values for all methods
  print(result$cutoff)
  
  # Review cutoff value used in plots
  print(result$cutoff_value)
  
  # Plot & print out distances between subsequent projections. 
  # These are convergence MCFS-ID statistics.
  plot(result, type = "distances")
  print(result$distances)
  
  # Plot & print out 50 most important features and show max RI values from 
  # permutation experiment.
  plot(result, type = "ri", size = 50)
  print(head(result$RI, 50))
  
  # Plot & print out 50 strongest feature interdependencies.
  plot(result, type = "id", size = 50)
  print(head(result$ID, 50))
  
  # Plot features ordered by RI_norm. Parameter 'size' is the number of 
  # top features in the chart. By default it is set on cutoff_value + 10%.
  plot(result, type = "features", cex = 1)
  
  # Here we set 'size' at fixed value 10.
  plot(result, type = "features", size = 10)
  
  # Plot cv classification result obtained on top features.
  # In the middle of x axis red label denotes cutoff_value.
  # plot(result, type = "cv", cv_measure = "wacc", cex = 0.8)
  
  # Plot & print out confusion matrix. This matrix is the result of 
  # all classifications performed by all decision trees on all s*t datasets.
  plot(result, type = "cmatrix")
  
  # build interdependencies graph (all default parameters).
  gid <- build.idgraph(result)
  plot(gid, label_dist = 1)
  
  # build interdependencies graph for top 6 features 
  # and top 12 interdependencies and plot all nodes
  gid <- build.idgraph(result, size = 6, size_ID = 12, orphan_nodes = TRUE)
  plot(gid, label_dist = 1)
  
  # Export graph to graphML (XML structure)
  path <- tempdir()
  igraph::write.graph(gid, file = file.path(path, "artificial.graphml"), 
                      format = "graphml", prefixAttr = FALSE)
  
  # Export and import results to/from csv files
  export.result(result, path = path, label = "artificial")
  result <- import.result(path = path, label = "artificial")
  
})

##################################################################
