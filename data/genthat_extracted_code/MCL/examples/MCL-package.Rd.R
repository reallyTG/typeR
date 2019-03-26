library(MCL)


### Name: MCL-package
### Title: Markov Cluster Algorithm
### Aliases: MCL-package
### Keywords: ts iteration

### ** Examples

### Load adjacency matrix
adjacency <- matrix(c(0,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,0,0,1,1,
             0,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,
             0,0,0,0,0,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,0,0,0,0,0,0,0), byrow=TRUE, nrow=9)

### Run MCL 
mcl(x = adjacency, addLoops = TRUE )



