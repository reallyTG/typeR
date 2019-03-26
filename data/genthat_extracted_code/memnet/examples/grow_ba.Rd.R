library(memnet)


### Name: grow_ba
### Title: Barabási & Albert (2002) network growth model
### Aliases: grow_ba

### ** Examples

# generate small graph
grow_ba(n = 6, m = 2)

## Not run: 
##D # generate large graph, flat degree distribution
##D grow_ba(n = 100, m = 10, p = .1)
##D 
##D # generate large graph, steep degree distribution
##D grow_ba(n = 100, m = 10, p = 10)
## End(Not run)




