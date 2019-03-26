library(netdiffuseR)


### Name: dgr
### Title: Indegree, outdegree and degree of the vertices
### Aliases: dgr degree indegree outdegree plot.diffnet_degSeq
### Keywords: univar

### ** Examples


# Comparing degree measurements ---------------------------------------------
# Creating an undirected graph
graph <- rgraph_ba()
graph

data.frame(
   In=dgr(graph, "indegree", undirected = FALSE),
   Out=dgr(graph, "outdegree", undirected = FALSE),
   Degree=dgr(graph, "degree", undirected = FALSE)
 )

# Testing on Korean Family Planning (weighted graph) ------------------------
data(kfamilyDiffNet)
d_unvalued <- dgr(kfamilyDiffNet, valued=FALSE)
d_valued   <- dgr(kfamilyDiffNet, valued=TRUE)

any(d_valued!=d_unvalued)

# Classic Scale-free plot ---------------------------------------------------
set.seed(1122)
g <- rgraph_ba(t=1e3-1)
hist(dgr(g))

# Since by default uses logscale, here we suppress the warnings
# on points been discarded for <=0.
suppressWarnings(plot(dgr(g)))




