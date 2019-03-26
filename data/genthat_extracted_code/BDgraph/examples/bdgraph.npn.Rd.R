library(BDgraph)


### Name: bdgraph.npn
### Title: Nonparametric transfer
### Aliases: bdgraph.npn

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 6, p = 4, size = 4 )
##D data     <- ( data.sim $ data - 3 ) ^ 4
##D data
##D    
##D # Transfer the data by truncation 
##D bdgraph.npn( data, npn = "truncation" )
##D   
##D # Transfer the data by shrunken 
##D bdgraph.npn( data, npn = "shrunken" )
##D   
##D # Transfer the data by skeptic 
##D bdgraph.npn( data, npn = "skeptic" )
## End(Not run)



