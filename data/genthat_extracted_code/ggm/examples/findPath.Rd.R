library(ggm)


### Name: findPath
### Title: Finding paths
### Aliases: findPath
### Keywords: graphs

### ** Examples

## A (single) path on a spanning tree
findPath(bfsearch(UG(~ a*b*c + b*d + d*e+ e*c))$tree, st=1, en=5)



