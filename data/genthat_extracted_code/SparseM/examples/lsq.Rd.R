library(SparseM)


### Name: lsq
### Title: Least Squares Problems in Surveying
### Aliases: lsq
### Keywords: datasets

### ** Examples

data(lsq)
class(lsq) # -> [1] "matrix.csc.hb"
model.matrix(lsq)->X
class(X) # -> "matrix.csr"
dim(X) # -> [1] 1850  712
y <- model.response(lsq) # extract the rhs
length(y) # [1] 1850 



