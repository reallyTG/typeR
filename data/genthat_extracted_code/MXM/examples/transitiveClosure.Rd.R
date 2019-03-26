library(MXM)


### Name: Transitive closure of an adjacency matrix
### Title: Returns the transitive closure of an adjacency matrix
### Aliases: transitiveClosure

### ** Examples

# example adjacency matrix
# simulate a dataset with continuous data
dataset <- matrix( runif(1000 * 10, 1, 100), nrow = 1000 ) 
test <- pc.con( dataset, method = "pearson", alpha = 0.05 )$G 
transitiveClosure(test)



