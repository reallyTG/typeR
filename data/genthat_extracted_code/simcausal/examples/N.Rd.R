library(simcausal)


### Name: N
### Title: Subsetting/Indexing 'DAG' Nodes
### Aliases: N

### ** Examples


D <- DAG.empty()
D <- D + node(name="W1", distr="rbern", prob=plogis(-0.5))
D <- D + node(name="W2", distr="rbern", prob=plogis(-0.5 + 0.5*W1))
D <- set.DAG(D)
#Returns all nodes from DAG D
N(D)
#Returns node W1 from DAG D
N(D)["W1"]



