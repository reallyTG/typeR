library(ggm)


### Name: grMAT
### Title: Graph to adjacency matrix
### Aliases: grMAT
### Keywords: graphs adjacency matrix mixed graph vector

### ** Examples

## Generating the adjacency matrix from an igraph object
exdag <- graph.formula(v7+-v8-+v5+-v6, v5-+v1+-v4-+v3, v1+-v2+-v3)
grMAT(exdag)

## Generating the adjacency matrix from a vector
exvec <-c ('b',1,2,'b',1,14,'a',9,8,'l',9,11,'a',10,8,
           'a',11,2,'a',11,10,'a',12,1,'b',12,14,'a',13,10,'a',13,12)
grMAT(exvec)



