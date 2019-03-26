library(bnlearn)


### Name: graph utilities
### Title: Utilities to manipulate graphs
### Aliases: 'graph utilities' acyclic directed path skeleton pdag2dag
###   subgraph
### Keywords: graphs

### ** Examples

data(learning.test)
res = gs(learning.test)

acyclic(res)
directed(res)
res = pdag2dag(res, ordering = LETTERS[1:6])
res
directed(res)
skeleton(res)



