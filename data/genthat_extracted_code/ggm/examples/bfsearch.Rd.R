library(ggm)


### Name: bfsearch
### Title: Breadth first search
### Aliases: bfsearch
### Keywords: graphs models multivariate

### ** Examples

## Finding a spanning tree of the butterfly graph
bfsearch(UG(~ a*b*o + o*u*j))
## Starting from another node
bfsearch(UG(~ a*b*o + o*u*j), v=3)



