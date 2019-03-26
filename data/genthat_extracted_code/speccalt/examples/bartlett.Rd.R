library(speccalt)


### Name: bartlett
### Title: bartlett
### Aliases: bartlett

### ** Examples

	# normalized Laplacian computation
	kern <- local.rbfdot(synth1)
	nelts <- dim(kern)[1]
	diag(kern) <- 0
	deg <- sapply(1:nelts, function(i) {
		return(sum(kern[i,]))
	})
	deg <- diag(deg)
	L <- diag(nelts) - solve(deg) 
	eig <- eigen(L)

	optK <- bartlett(eig$values)$k



