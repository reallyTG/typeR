library(lle)


### Name: find_nn_eps
### Title: Find nearest neighbours in epsilon environment.
### Aliases: find_nn_eps

### ** Examples

	data( lle_scurve_data )
	X <- lle_scurve_data
	neighbours <- find_nn_eps( X, 0.5 )
	table( rowSums(neighbours) )



