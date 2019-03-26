library(PCIT)


### Name: idxInvert
### Title: Invert linear indices from a matrix
### Aliases: idxInvert

### ** Examples

	m <- matrix(1, 5, 5)
	diag(m) <- 0
	m
	idx <- which(m==0)
	idx
	idxInvert(m, idx)
	idxInvert(5, idx)



