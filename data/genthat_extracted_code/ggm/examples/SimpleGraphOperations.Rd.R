library(ggm)


### Name: Simple Graph Operations
### Title: Simple graph operations
### Aliases: bd ch pa
### Keywords: graphs models multivariate

### ** Examples

## find boundary of a subset of nodes of a DAG
G <- DAG(y ~ x+b+a, b~a, x~a)
bd("b", G)
bd(c("b", "x"), G)
bd("x", G)
bd(c("x","b"), G)
## find boundary of a subset of nodes of an UG
G <- UG(~ y*x*z + z*h*v)
bd("z", G)
bd(c("y", "x"), G)
bd("v", G)
bd(c("x","v"), G)
## children of a subset of nodes of a DAG
G <- DAG(y ~ x+b+a, b~a, x~a)
ch("b", G)
ch(c("b", "x"), G)
ch("x", G)
ch(c("a","x"), G)
## parents of a subset of nodes of a DAG
pa("b", G)
pa(c("b", "x"), G)
pa("x", G)
pa(c("x","b"), G)



