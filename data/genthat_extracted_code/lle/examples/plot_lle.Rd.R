library(lle)


### Name: plot_lle
### Title: Plot LLE results
### Aliases: plot_lle

### ** Examples

	data( lle_scurve_data )
	X <- lle_scurve_data
	Y <- lle( X, m=2, k=12 )$Y
	plot_lle( Y, X, FALSE, col="red", inter=TRUE )



