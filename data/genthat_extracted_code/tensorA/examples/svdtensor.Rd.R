library(tensorA)


### Name: svd.tensor
### Title: Singular value decomposition of tensors
### Aliases: svd.tensor
### Keywords: arith

### ** Examples

# SVD
A <- to.tensor(rnorm(120),c(a=2,b=2,c=5,d=3,e=2))

SVD <- svd.tensor(A,c("a","d"),c("b","c"),by="e")
dim(SVD$v)
# Property of decomposition
einstein.tensor(SVD$v,diag=SVD$d,SVD$u,by="e") # A
# Property of orthogonality
SVD$v %e% SVD$v[[lambda=~"lambda'"]]         # 2*delta.tensor(c(lambda=6))
SVD$u %e% SVD$u[[lambda=~"lambda'"]]         # 2*delta.tensor(c(lambda=6)))
SVD$u %e% mark(SVD$u,"'",c("a","d"))  # 2*delta.tensor(c(a=2,d=3)))






