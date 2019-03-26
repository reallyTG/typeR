library(ggm)


### Name: topSort
### Title: Topological sort
### Aliases: topSort topOrder
### Keywords: graphs models multivariate

### ** Examples

## A simple example
dag <- DAG(a ~ b, c ~ a + b, d ~ c + b)
dag
topOrder(dag)
topSort(dag)



