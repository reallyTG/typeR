library(SparseM)


### Name: SparseM.hb
### Title: Harwell-Boeing Format Sparse Matrices
### Aliases: SparseM.hb read.matrix.hb model.matrix,ANY-method
###   model.matrix,matrix.csc.hb-method model.matrix,matrix.ssc.hb-method
###   model.matrix.matrix.ssc.hb model.response,ANY-method
###   model.response,matrix.csc.hb-method
###   model.response,matrix.ssc.hb-method model.guess,matrix.csc.hb-method
###   model.guess,matrix.ssc.hb-method model.xexact,matrix.csc.hb-method
###   model.xexact,matrix.ssc.hb-method model.response model.guess
###   model.xexact model.matrix
### Keywords: IO

### ** Examples
 
Xy <- read.matrix.hb(system.file("extdata","lsq.rra",package = "SparseM"))
class(Xy) # -> [1] "matrix.csc.hb"
X <- model.matrix(Xy)->X
class(X) # -> "matrix.csr"
dim(X) # -> [1] 1850  712
y <- model.response(Xy) # extract the rhs
length(y) # [1] 1850
Xy <- read.matrix.hb(system.file("extdata","rua_32_ax.rua",package = "SparseM"))
X <- model.matrix(Xy)
y <- model.response(Xy) # extract the rhs
g <- model.guess(Xy) # extract the guess 
a <- model.xexact(Xy) # extract the xexact 
fit <- solve(t(X) %*% X, t(X) %*% y) # compare solution with xexact solution 



