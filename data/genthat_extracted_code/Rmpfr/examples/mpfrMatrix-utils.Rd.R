library(Rmpfr)


### Name: mpfrMatrix-utils
### Title: Functions for mpfrMatrix Objects
### Aliases: determinant.mpfrMatrix
### Keywords: array

### ** Examples

m6 <- mpfrArray(1:6, prec=128, dim = c(2L, 3L))
m6
S2 <- m6[,-3] # 2 x 2
S3 <- rbind(m6, c(1:2,10))
det(S2)
str(determinant(S2))
det(S3)
stopifnot(all.equal(det(S2), det(asNumeric(S2)), tolerance=1e-15),
	  all.equal(det(S3), det(asNumeric(S3)), tolerance=1e-15))



