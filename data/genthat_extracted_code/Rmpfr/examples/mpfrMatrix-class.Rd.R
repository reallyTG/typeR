library(Rmpfr)


### Name: mpfrMatrix
### Title: Classes "mpfrMatrix" and "mpfrArray"
### Aliases: mpfrMatrix-class mpfrArray-class Arith,mpfrArray,mpfr-method
###   Arith,mpfrArray,mpfrArray-method Arith,mpfr,mpfrArray-method
###   Arith,mpfrArray,numeric-method Arith,numeric,mpfrArray-method
###   Compare,mpfrArray,mpfr-method Compare,mpfrArray,numeric-method
###   Compare,mpfr,mpfrArray-method Compare,numeric,mpfrArray-method
###   apply,mpfrArray-method colSums,mpfrArray-method
###   colMeans,mpfrArray-method rowSums,mpfrArray-method
###   rowMeans,mpfrArray-method as.vector,mpfrArray,missing-method
###   coerce,mpfrArray,array-method coerce,mpfrArray,matrix-method
###   coerce,mpfrMatrix,matrix-method coerce,mpfrArray,vector-method
###   coerce<-,mpfrArray,vector-method diag,mpfrMatrix-method
###   diag<-,mpfrMatrix-method [<-,mpfrArray,ANY,ANY,ANY-method
###   [<-,mpfrArray,ANY,ANY,mpfr-method
###   [<-,mpfrArray,ANY,missing,ANY-method
###   [<-,mpfrArray,ANY,missing,mpfr-method
###   [<-,mpfrArray,missing,ANY,ANY-method
###   [<-,mpfrArray,missing,ANY,mpfr-method
###   [<-,mpfrArray,missing,missing,ANY-method
###   [<-,mpfrArray,missing,missing,mpfr-method
###   [<-,mpfrArray,matrix,missing,ANY-method
###   [<-,mpfrArray,matrix,missing,mpfr-method
###   [,mpfrArray,ANY,ANY,ANY-method [,mpfrArray,ANY,missing,missing-method
###   [,mpfrArray,matrix,missing,missing-method %*%,Mnumber,mpfr-method
###   %*%,mpfrMatrix,mpfr-method %*%,mpfrMatrix,mpfrMatrix-method
###   %*%,mpfr,Mnumber-method %*%,mpfr,mpfr-method
###   %*%,mpfr,mpfrMatrix-method crossprod,mpfr,missing-method
###   crossprod,mpfrMatrix,mpfr-method
###   crossprod,mpfrMatrix,mpfrMatrix-method crossprod,mpfr,Mnumber-method
###   crossprod,mpfr,mpfr-method crossprod,mpfr,mpfrMatrix-method
###   crossprod,Mnumber,mpfr-method tcrossprod,mpfr,missing-method
###   tcrossprod,mpfrMatrix,mpfr-method
###   tcrossprod,mpfrMatrix,mpfrMatrix-method
###   tcrossprod,mpfr,Mnumber-method tcrossprod,mpfr,mpfr-method
###   tcrossprod,mpfr,mpfrMatrix-method tcrossprod,Mnumber,mpfr-method
###   dim,mpfrArray-method dimnames<-,mpfrArray-method
###   dimnames,mpfrArray-method norm,ANY,missing-method
###   norm,mpfrMatrix,character-method show,mpfrArray-method
###   sign,mpfrArray-method t,mpfrMatrix-method aperm,mpfrArray-method
### Keywords: classes

### ** Examples

showClass("mpfrMatrix")

validObject(mm <- new("mpfrMatrix"))
validObject(aa <- new("mpfrArray"))

v6 <- mpfr(1:6, 128)
m6 <- new("mpfrMatrix", v6, Dim = c(2L, 3L))
validObject(m6)
m6
which(m6 == 3, arr.ind = TRUE) # |-->  (1, 2)
## Coercion back to "vector": Both of these work:
stopifnot(identical(as(m6, "mpfr"), v6),
	  identical(as.vector(m6), v6)) # < but this is a "coincidence"

S2 <- m6[,-3] # 2 x 2
S3 <- rbind(m6, c(1:2,10)) ; s3 <- asNumeric(S3)
det(S2)
str(determinant(S2))
det(S3)
stopifnot(all.equal(det(S2), det(asNumeric(S2)), tol=1e-15),
	  all.equal(det(S3), det(s3), tol=1e-15))

## 2-column matrix indexing and replacement:
(sS <- S3[i2 <- cbind(1:2, 2:3)])
stopifnot(identical(asNumeric(sS), s3[i2]))
C3 <- S3; c3 <- s3
C3[i2] <- 10:11
c3[i2] <- 10:11
stopifnot(identical(asNumeric(C3), c3))

AA <- new("mpfrArray", as.vector(cbind(S3, -S3)), Dim=c(3L,3:2))
stopifnot(identical(AA[,,1] , S3), identical(AA[,,2] , -S3))
aa <- asNumeric(AA)

i3 <- cbind(3:1, 1:3, c(2L, 1:2))
ii3 <- Rmpfr:::.mat2ind(i3, dim(AA), dimnames(AA))
stopifnot(aa[i3] == new("mpfr", getD(AA)[ii3]))
stopifnot(identical(aa[i3], asNumeric(AA[i3])))
CA <- AA; ca <- aa
ca[i3] <- ca[i3] ^ 3
CA[i3] <- CA[i3] ^ 3

## scale():
S2. <- scale(S2)
stopifnot(all.equal(abs(as.vector(S2.)), rep(sqrt(1/mpfr(2, 128)), 4),
		    tol = 1e-30))

## norm() :
norm(S2)
stopifnot(identical(norm(S2), norm(S2, "1")),
          norm(S2, "I") == 6,
          norm(S2, "M") == 4,
          abs(norm(S2, "F") - 5.477225575051661) < 1e-15)



