library(ggm)


### Name: DG
### Title: Directed graphs
### Aliases: DG
### Keywords: graphs directed graph models multivariate

### ** Examples

## A DAG
DG(y ~ x, x ~ z, z ~ u)

## A cyclic directed graph
DG(y ~ x, x ~ z, z ~ y)

## A graph with two arrows between two nodes
DG(y ~ x, x ~ y)

## There can be isolated nodes
DG(y ~ x, x ~ x)



