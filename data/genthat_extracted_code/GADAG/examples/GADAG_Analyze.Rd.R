library(GADAG)


### Name: GADAG_Analyze
### Title: Analyze GADAG results.
### Aliases: GADAG_Analyze

### ** Examples

 #############################################################
 # Loading toy data
 #############################################################
 data(toy_data)
 # toy_data is a list of two matrices corresponding to a "star"
 # DAG (node 1 activates all other nodes):
 # - toy_data$X is a 100x10 design matrix
 # - toy_data$G is the 10x10 adjacency matrix (ground trough)

 ########################################################
 # Evaluating GADAG Results
 ########################################################
 # simple run, where you only get the precision, recall, number
 # of false positives, true positives, false negatives, true negatives
 # and mean squared error of the estimated graph

 # run GADAG with the predefined parameters
 GADAG_results <- GADAG_Run(X=toy_data$X, lambda=0.1)

 # analyze the results
 GADAG_analysis <- GADAG_Analyze(GADAG_results, G=toy_data$G, X=toy_data$X)
 print(GADAG_analysis) # here are the results

 # more complex run, where you want to have some details about the procedure
 ## Not run: 
##D  # run GADAG with return.level set to 1 beforehand
##D  GADAG_results <- GADAG_Run(X=toy_data$X, lambda=0.1,return.level=1)
##D 
##D  # print the evolution of the algorithm
##D  plot.evol <- TRUE
##D  GADAG_analysis <- GADAG_Analyze(GADAG_results, G=toy_data$G, X=toy_data$X,
##D           plot.control = list(plot.evol=TRUE))
##D 
##D  # in addition, print the estimated and the true graph
##D  plot.graph <- TRUE
##D  GADAG_analysis <- GADAG_Analyze(GADAG_results, G=toy_data$G, X=toy_data$X,
##D           plot.control = list(plot.evol=plot.evol, plot.graph= plot.graph))
##D 
##D  # now save the results in .png, but only for the graphs
##D  plot.png <- TRUE
##D  GADAG_analysis <- GADAG_Analyze(GADAG_results, G=toy_data$G, X=toy_data$X,
##D           plot.control = list(plot.graph= plot.graph, plot.png = plot.png))
##D 
##D  # in case you don't know the true DAG, you can't really know how good the
##D  # estimation is. You can't compute the precision, recall, MSE but you can
##D  # still plot the estimated graph and see the evolution of the algorithm
##D  plot.graph <- plot.evol <- TRUE
##D  plot.png <- FALSE
##D  GADAG_analysis <- GADAG_Analyze(GADAG_results, X=toy_data$X,
##D           plot.control = list(plot.graph= plot.graph, plot.evol = plot.evol))
##D  
## End(Not run)



