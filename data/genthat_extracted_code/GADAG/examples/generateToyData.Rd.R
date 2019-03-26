library(GADAG)


### Name: generateToyData
### Title: Generate toy data for running GADAG
### Aliases: generateToyData

### ** Examples

 #############################################################
 # Generating toy data
 #############################################################
 toy_data <- generateToyData(n=100, p=10)

 # toy_data is a list of two matrices corresponding to a "star"
 # DAG (node 1 activates all other nodes):
 # - toy_data$X is a 100x10 design matrix
 # - toy_data$G is the 10x10 adjacency matrix (ground trough)

 ## Not run: 
##D  # generate another type of data: a DAG with 100 nodes in a path form
##D  toy_data <- generateToyData(n=100, p=100,type="path")
##D  
## End(Not run)

 ## Not run: 
##D  # set the minimal edge value to 1
##D  toy_data <- generateToyData(n=100, p=10, edgemin=1) # all edges are set to 1
##D  
## End(Not run)



