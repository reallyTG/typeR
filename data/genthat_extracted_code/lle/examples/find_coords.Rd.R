library(lle)


### Name: find_coords
### Title: Calculate embedded data.
### Aliases: find_coords

### ** Examples

	data( lle_scurve_data )
	X <- lle_scurve_data
	nns <- find_nn_k(X,5)
	wgts <- find_weights(nns,X,2)
	Y <- find_coords( wgts$wgts, nns, dim(X)[1], 3, 2 )



