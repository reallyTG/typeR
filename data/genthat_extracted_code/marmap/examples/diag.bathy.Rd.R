library(marmap)


### Name: diag.bathy
### Title: Finds matrix diagonal for non-square matrices
### Aliases: diag.bathy

### ** Examples

	
# a square matrix: diag.bathy behaves as diag
	matrix(1:25, 5, 5) -> a ; a
	diag(a)
	diag.bathy(a)

# a non-square matrix: diag.bathy does not behaves as diag
	matrix(1:15, 3, 5) -> b ; b
	diag(b)
	diag.bathy(b)
	
# output the diagonal or its coordinates: 
	rownames(b) <- seq(32,35, length.out=3)
	colnames(b) <- seq(-100,-95, length.out=5)
	diag.bathy(b, coord=FALSE)
	diag.bathy(b, coord=TRUE)
	



