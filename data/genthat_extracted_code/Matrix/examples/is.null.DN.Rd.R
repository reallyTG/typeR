library(Matrix)


### Name: is.null.DN
### Title: Are the Dimnames 'dn' NULL-like ?
### Aliases: is.null.DN
### Keywords: utilities

### ** Examples

m <- matrix(round(100 * rnorm(6)), 2,3); m1 <- m2 <- m3 <- m4 <- m
dimnames(m1) <- list(NULL, NULL)
dimnames(m2) <- list(NULL, character())
dimnames(m3) <- rev(dimnames(m2))
dimnames(m4) <- rep(list(character()),2)

m4 ## prints absolutely identically to  m

stopifnot(m == m1, m1 == m2, m2 == m3, m3 == m4,
	  identical(capture.output(m) -> cm,
		    capture.output(m1)),
	  identical(cm, capture.output(m2)),
	  identical(cm, capture.output(m3)),
	  identical(cm, capture.output(m4)))



