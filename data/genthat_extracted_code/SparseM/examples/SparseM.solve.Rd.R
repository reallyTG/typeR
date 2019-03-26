library(SparseM)


### Name: SparseM.solve
### Title: Linear Equation Solving for Sparse Matrices
### Aliases: SparseM.solve chol,ANY-method chol,matrix.csr-method
###   chol,matrix.csc-method chol,matrix-method chol backsolve-methods
###   backsolve,ANY-method backsolve forwardsolve solve
###   backsolve,matrix.csr.chol-method forwardsolve,matrix.csr.chol-method
###   solve,ANY-method solve,matrix.csr-method
### Keywords: algebra

### ** Examples

data(lsq)
class(lsq) # -> [1] "matrix.csc.hb"
model.matrix(lsq)->design.o
class(design.o) # -> "matrix.csr"
dim(design.o) # -> [1] 1850  712
y <- model.response(lsq) # extract the rhs
length(y) # [1] 1850

t(design.o) %*% design.o -> XpX
t(design.o) %*% y -> Xpy
chol(XpX) -> chol.o

b1 <- backsolve(chol.o,Xpy) # least squares solutions in two steps
b2 <- solve(XpX,Xpy)        # least squares estimates in one step
b3 <- backsolve(chol.o, forwardsolve(chol.o, Xpy),
                twice = FALSE) # in three steps
## checking that these three are indeed equal :
stopifnot(all.equal(b1, b2), all.equal(b2, b3))



