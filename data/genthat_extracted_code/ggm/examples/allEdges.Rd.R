library(ggm)


### Name: allEdges
### Title: All edges of a graph
### Aliases: allEdges
### Keywords: graphs models multivariate

### ** Examples

## A UG graph
allEdges(UG(~ y*v*k +v*k*d+y*d))

## A DAG
allEdges(DAG(u~h+o+p, h~o, o~p))



