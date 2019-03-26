library(ggm)


### Name: DAG
### Title: Directed acyclic graphs (DAGs)
### Aliases: DAG
### Keywords: graphs models multivariate

### ** Examples

## A Markov chain
DAG(y ~ x, x ~ z, z ~ u)

## Another DAG
DAG(y ~ x + z + u, x ~ u, z ~ u)

## A DAG with an isolated node
DAG(v ~ v, y ~ x + z, z ~ w + u)

## There can be repetitions
DAG(y ~ x + u + v, y ~ z, u ~ v + z)

## Interactions are ignored
DAG(y ~ x*z + z*v, x ~ z)

## A cyclic graph returns an error!
## Not run: DAG(y ~ x, x ~ z, z ~ y)

## The order can be changed
DAG(y ~ z, y ~ x + u + v,  u ~ v + z)

## If you want to order the nodes (topological sort of the DAG)
DAG(y ~ z, y ~ x + u + v,  u ~ v + z, order=TRUE)



