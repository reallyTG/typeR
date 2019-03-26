library(MXM)


### Name: Interactive plot of an (un)directed graph
### Title: Interactive plot of an (un)directed graph
### Aliases: plotnetwork
### Keywords: Network plot directed graph interactive graph

### ** Examples

# simulate a dataset with continuous data
dataset <- matrix(runif(1000 * 20, 1, 100), nrow = 1000 ) 
a <- mmhc.skel(dataset, max_k = 3, threshold = 0.05, test = "testIndFisher", 
nc = 1) 
plotnetwork(a$G)
plotnetwork(a$G, titlos = "DAG skeleton")



