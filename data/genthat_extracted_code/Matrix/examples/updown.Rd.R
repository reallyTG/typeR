library(Matrix)


### Name: updown
### Title: Up- and Down-Dating a Cholesky Decomposition
### Aliases: updown updown-methods updown,ANY,ANY,ANY-method
###   updown,character,mMatrix,CHMfactor-method
###   updown,logical,mMatrix,CHMfactor-method
### Keywords: methods

### ** Examples

dn <- list(LETTERS[1:3], letters[1:5])
## pointer vectors can be used, and the (i,x) slots are sorted if necessary:
m <- sparseMatrix(i = c(3,1, 3:2, 2:1), p= c(0:2, 4,4,6), x = 1:6, dimnames = dn)
cA <- Cholesky(A <- crossprod(m) + Diagonal(5))
166 * as(cA,"Matrix") ^ 2
uc1 <- updown("+",   Diagonal(5), cA)
## Hmm: this loses positive definiteness:
uc2 <- updown("-", 2*Diagonal(5), cA)
image(show(as(cA, "Matrix")))
image(show(c2 <- as(uc2,"Matrix")))# severely negative entries
##--> Warning



