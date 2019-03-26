library(SIN)


### Name: getgraph
### Title: Obtain graph from simultaneous p-values
### Aliases: getgraph
### Keywords: multivariate

### ** Examples

data(fowlbones)
pvals <- sinUG(fowlbones$corr,fowlbones$n)
alpha <- 0.2
## get undirected graph
getgraph(pvals, alpha, type="UG") 
## forget that we used sinUG and get acyclic directed graph
getgraph(pvals, alpha, type="DAG")
## forget that we used sinUG and get bidirected graph
getgraph(pvals, alpha, type="BG")
## forget that we used sinUG and get chain graph
myblocks <- list(1:2,3:4,5:6)
getgraph(pvals, alpha, type="CG", blocks=myblocks)



