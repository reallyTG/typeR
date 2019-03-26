library(lle)


### Name: find_nn_k
### Title: Find k nearest neighbours.
### Aliases: find_nn_k

### ** Examples

	data( lle_scurve_data )
	X <- lle_scurve_data
	neighbours <- find_nn_k( X, 5 )
	table( rowSums( neighbours ) )



