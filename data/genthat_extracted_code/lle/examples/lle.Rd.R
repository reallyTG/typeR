library(lle)


### Name: lle
### Title: Locally linear embedding main function.
### Aliases: lle

### ** Examples

	# perform LLE
	data( lle_scurve_data )
	X <- lle_scurve_data
	results <- lle( X=X, m=2, k=12, reg=2, ss=FALSE, id=TRUE, v=0.9 )
	str( results )
	
	# plot results and intrinsic dimension (manually)
	split.screen( c(2,1) )
	screen(1)
	plot( results$Y, main="embedded data", xlab=expression(y[1]), ylab=expression(y[2]) )
	screen(2)
	plot( results$id, main="intrinsic dimension", type="l", xlab=expression(x[i]), ylab="id", lwd=2 )




