library(cccd)


### Name: rng
### Title: Relative Neighborhood Graph.
### Aliases: rng
### Keywords: graphs

### ** Examples

x <- matrix(runif(100),ncol=2)

g <- rng(x)
## Not run: 
##D plot(g)
## End(Not run)

## Example using 'open':
g <- graph.full(5,directed=FALSE)

g1 <- rng(x=get.adjacency(g,sparse=FALSE),open=TRUE)
ecount(g1)
g2 <- rng(x=get.adjacency(g,sparse=FALSE),open=FALSE)
graph.isomorphic(g2,g)





