library(rmcfs)


### Name: plot.mcfs
### Title: Plots various MCFS result components
### Aliases: plot.mcfs

### ** Examples

  ## Not run: 
##D ###dontrunbegin
##D 
##D   # Create input data.
##D   adata <- artificial.data(rnd_features = 10)
##D   showme(adata)
##D   
##D   # Parametrize and run MCFS-ID procedure.
##D   result <- mcfs(class~., adata, cutoffPermutations = 0, featureFreq = 10,
##D                   finalCV = FALSE, finalRuleset = TRUE, threadsNumber = 2)
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
##D   # plot(result, type = "cv", measure = "wacc", cex = 0.8)
##D   
##D   # Plot & print out confusion matrix. This matrix is the result of 
##D   # all classifications performed by all decision trees on all s*t datasets.
##D   plot(result, type = "cmatrix")
##D   
##D   
## End(Not run)###dontrunend



