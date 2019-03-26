library(Matrix)


### Name: unpack
### Title: Representation of Packed and Unpacked (Dense) Matrices
### Aliases: pack pack,symmetricMatrix-method pack,triangularMatrix-method
###   pack,matrix-method pack,sparseMatrix-method unpack
###   unpack,dtpMatrix-method unpack,dspMatrix-method
###   unpack,symmetricMatrix-method unpack,triangularMatrix-method
###   unpack,sparseMatrix-method
### Keywords: array algebra

### ** Examples

showMethods("unpack")
(cp4 <- chol(Hilbert(4))) # is triangular
tp4 <- as(cp4,"dtpMatrix")# [t]riangular [p]acked
str(tp4)
(unpack(tp4))
stopifnot(identical(tp4, pack(unpack(tp4))))

(s <- crossprod(matrix(sample(15), 5,3))) # traditional symmetric matrix
(sp <- pack(s))
mt <- as.matrix(tt <- tril(s))
(pt <- pack(mt))
stopifnot(identical(pt, pack(tt)),
	  dim(s ) == dim(sp), all(s  == sp),
	  dim(mt) == dim(pt), all(mt == pt), all(mt == tt))
showMethods("pack")



