library(igraph)


### Name: curve_multiple
### Title: Optimal edge curvature when plotting graphs
### Aliases: curve_multiple autocurve.edges
### Keywords: graphs

### ** Examples


g <- graph( c(0,1,1,0,1,2,1,3,1,3,1,3,
              2,3,2,3,2,3,2,3,0,1)+1 )

curve_multiple(g)

## Not run: 
##D set.seed(42)
##D plot(g)
## End(Not run)




