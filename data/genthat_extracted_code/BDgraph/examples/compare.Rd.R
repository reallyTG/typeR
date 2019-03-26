library(BDgraph)


### Name: compare
### Title: Graph structure comparison
### Aliases: compare

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 50, p = 6, size = 7, vis = TRUE )
##D     
##D # Running sampling algorithm based on GGMs 
##D sample.ggm <- bdgraph( data = data.sim, method = "ggm", iter = 10000 )
##D 
##D # Comparing the results
##D compare( data.sim, sample.ggm, main = c( "True", "GGM" ), vis = TRUE )
##D     
##D # Running sampling algorithm based on GCGMs
##D sample.gcgm <- bdgraph( data = data.sim, method = "gcgm", iter = 10000 )
##D 
##D # Comparing GGM and GCGM methods
##D compare( data.sim, sample.ggm, sample.gcgm, main = c( "True", "GGM", "GCGM" ), vis = TRUE )
## End(Not run)



