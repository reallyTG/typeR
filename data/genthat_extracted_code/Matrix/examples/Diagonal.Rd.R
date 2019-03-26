library(Matrix)


### Name: Diagonal
### Title: Create Diagonal Matrix Object
### Aliases: Diagonal .sparseDiagonal .symDiagonal .trDiagonal
### Keywords: array algebra

### ** Examples

Diagonal(3)
Diagonal(x = 10^(3:1))
Diagonal(x = (1:4) >= 2)#-> "ldiMatrix"

## Use Diagonal() + kronecker() for "repeated-block" matrices:
M1 <- Matrix(0+0:5, 2,3)
(M <- kronecker(Diagonal(3), M1))

(S <- crossprod(Matrix(rbinom(60, size=1, prob=0.1), 10,6)))
(SI <- S + 10*.symDiagonal(6)) # sparse symmetric still
stopifnot(is(SI, "dsCMatrix"))
(I4 <- .sparseDiagonal(4, shape="t"))# now (2012-10) unitriangular
stopifnot(I4@diag == "U", all(I4 == diag(4)))
## Don't show: 
  L <- Diagonal(5, TRUE)
  stopifnot(L@diag == "U", identical(L, Diagonal(5) > 0))
## End(Don't show)



