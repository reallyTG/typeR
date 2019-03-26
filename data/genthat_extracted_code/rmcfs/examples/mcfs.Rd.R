library(rmcfs)


### Name: mcfs
### Title: MCFS-ID (Monte Carlo Feature Selection and Interdependency
###   Discovery)
### Aliases: mcfs

### ** Examples

  ## Not run: 
##D ###dontrunbegin
##D 
##D   ####################################
##D   ######### Artificial data ##########
##D   ####################################
##D 
##D   # create input data and review it
##D   adata <- artificial.data(rnd_features = 10)
##D   showme(adata)
##D   
##D   # Parametrize and run MCFS-ID procedure
##D   result <- mcfs(class~., adata, cutoffPermutations = 3, featureFreq = 50,
##D                   buildID = TRUE, finalCV = FALSE, finalRuleset = FALSE, 
##D                   threadsNumber = 2)
##D 
##D   # Print basic information about mcfs result
##D   print(result)
##D 
##D   # Review cutoff values for all methods
##D   print(result$cutoff)
##D   
##D   # Review cutoff value used in plots
##D   print(result$cutoff_value)
##D   
##D   # Plot & print out distances between subsequent projections. 
##D   # These are convergence MCFS-ID statistics.
##D   plot(result, type = "distances")
##D   print(result$distances)
##D   
##D   # Plot & print out 50 most important features and show max RI values from 
##D   # permutation experiment.
##D   plot(result, type = "ri", size = 50)
##D   print(head(result$RI, 50))
##D   
##D   # Plot & print out 50 strongest feature interdependencies.
##D   plot(result, type = "id", size = 50)
##D   print(head(result$ID, 50))
##D   
##D   # Plot features ordered by RI_norm. Parameter 'size' is the number of 
##D   # top features in the chart. By default it is set on cutoff_value + 10##D 
##D   plot(result, type = "features", cex = 1)
##D 
##D   # Here we set 'size' at fixed value 10.
##D   plot(result, type = "features", size = 10)
##D 
##D   # Plot cv classification result obtained on top features.
##D   # In the middle of x axis red label denotes cutoff_value.
##D   # plot(result, type = "cv", cv_measure = "wacc", cex = 0.8)
##D 
##D   # Plot & print out confusion matrix. This matrix is the result of 
##D   # all classifications performed by all decision trees on all s*t datasets.
##D   plot(result, type = "cmatrix")
##D   
##D   # build interdependencies graph (all default parameters).
##D   gid <- build.idgraph(result)
##D   plot(gid, label_dist = 1)
##D   
##D   # build interdependencies graph for top 6 features 
##D   # and top 12 interdependencies and plot all nodes
##D   gid <- build.idgraph(result, size = 6, size_ID = 12, orphan_nodes = TRUE)
##D   plot(gid, label_dist = 1)
##D   
##D   # Export graph to graphML (XML structure)
##D   path <- tempdir()
##D   igraph::write.graph(gid, file = file.path(path, "artificial.graphml"), 
##D               format = "graphml", prefixAttr = FALSE)
##D   
##D   # Export and import results to/from csv files
##D   export.result(result, path = path, label = "artificial")
##D   result <- import.result(path = path, label = "artificial")
##D 
##D   ####################################
##D   ########## Alizadeh data ###########
##D   ####################################
##D   
##D   # Load Alizadeh dataset.
##D   # A 4026 x 62 gene expression data matrix of log-ratio values. The last column contains 
##D   # the annotations of the 62 samples with respect to the cancer types C, D, F.
##D   # The data are from the lymphoma/leukemia study of A. Alizadeh et al., Nature 403:503-511 (2000), 
##D   # http://llmpp.nih.gov/lymphoma/index.shtml
##D   
##D   alizadeh <- read.csv(file="http://www.ipipan.eu/staff/m.draminski/files/data/alizadeh.csv", 
##D                         stringsAsFactors = FALSE)
##D   showme(alizadeh)
##D   
##D   # Fix data types and data values - replace characters such as "," " " "/" etc. 
##D   # from values and column names and fix data types
##D   # This function may help if mcfs has any problems with input data
##D   alizadeh <- fix.data(alizadeh)
##D   
##D   # Run MCFS-ID procedure on default parameters. 
##D   # For larger real data (thousands of features) default 'auto' settings are the best.
##D   # This example may take 10-20 minutes but this one is a real dataset with 4026 features.
##D   # Set up more threads according to your CPU cores number.
##D   result <- mcfs(class~., alizadeh, featureFreq = 100, cutoffPermutations = 10, threadsNumber = 8)
##D 
##D   # Print basic information about mcfs result.
##D   print(result)
##D   
##D   # Plot & print out distances between subsequent projections. 
##D   plot(result, type="distances")
##D   
##D   # Show RI values for top 500 features and max RI values from permutation experiment.
##D   plot(result, type = "ri", size = 500)
##D   
##D   # Plot heatmap on top features, only numeric features are presented
##D   plot(result, type = "heatmap", size = 20, heatmap_norm = 'norm', heatmap_fun = 'median')
##D   
##D   # Plot cv classification result obtained on top features.
##D   # In the middle of x axis red label denotes cutoff_value.
##D   plot(result, type = "cv", cv_measure = "wacc", cex = 0.8)
##D   
##D   # build interdependencies graph.
##D   gid <- build.idgraph(result, size = 20)
##D   plot.idgraph(gid, label_dist = 0.3)
##D   
##D   
## End(Not run)###dontrunend



