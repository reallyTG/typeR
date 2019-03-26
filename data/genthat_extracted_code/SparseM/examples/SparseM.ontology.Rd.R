library(SparseM)


### Name: SparseM.ontology
### Title: Sparse Matrix Class
### Aliases: SparseM.ontology matrix.csr matrix.csc initialize,ANY-method
###   initialize,matrix.csr-method initialize,matrix.coo-method
###   coerce,vector,matrix.diag.csr-method coerce,matrix,matrix.csr-method
###   coerce,matrix.csr,matrix.diag.csr-method
###   coerce,vector,matrix.csr-method coerce,numeric,matrix.diag.csr-method
###   as.matrix,ANY-method as.matrix,matrix.csr-method as.matrix,csr-method
###   is.matrix,csr-methods as.matrix,csc-methods is.matrix,csc-methods
###   as.matrix,ssr-methods is.matrix,ssr-methods as.matrix,ssc-methods
###   is.matrix,ssc-methods as.matrix,coo-methods is.matrix,coo-methods
###   as.matrix.csr,ANY-method as.matrix.csr,matrix.csc-method
###   as.matrix.csr,matrix.ssr-method as.matrix.csr,matrix.ssc-method
###   as.matrix.csr,matrix.coo-method as.matrix.csr,matrix.csr.chol-method
###   as.matrix.csc,ANY-method as.matrix.csc,matrix.csr-method
###   as.matrix.csc,matrix.csc-method as.matrix.csc,matrix.ssr-method
###   as.matrix.csc,matrix.ssc-method as.matrix.csc,matrix.coo-method
###   as.matrix.ssr,ANY-method as.matrix.ssr,matrix.csc-method
###   as.matrix.ssr,matrix.ssr-method as.matrix.ssr,matrix.ssc-method
###   as.matrix.ssr,matrix.coo-method as.matrix.ssc,ANY-method
###   as.matrix.ssc,matrix.csr-method as.matrix.ssc,matrix.csc-method
###   as.matrix.ssc,matrix.ssr-method as.matrix.ssc,matrix.ssc-method
###   as.matrix.ssc,matrix.coo-method as.matrix.coo,ANY-method
###   as.matrix.coo,matrix.csr-method as.matrix.coo,matrix.csc-method
###   as.matrix.coo,matrix.ssr-method as.matrix.coo,matrix.ssc-method
###   as.matrix.coo,matrix.coo-method as.matrix,matrix.csc-method
###   as.matrix,matrix.ssc-method as.matrix,matrix.ssr-method
###   as.matrix,matrix.coo-method matrix.ssc
###   as.matrix.ssc,matrix.csc-method as.matrix.ssc.matrix.csr-method
###   as.matrix.ssc,matrix.ssr-method matrix.ssr
###   as.matrix.ssr,matrix.csc-method as.matrix.ssr,matrix.csr-method
###   as.matrix.ssr,matrix.ssc-method is.matrix.csr is.matrix.csc
###   is.matrix.ssr is.matrix.ssc is.matrix.coo is.matrix.csr as.matrix.csr
###   as.matrix.csc as.matrix.ssr as.matrix.ssc as.matrix.coo
### Keywords: algebra

### ** Examples

n1 <- 10
p <- 5
a <- rnorm(n1*p)
a[abs(a)<0.5] <- 0
A <- matrix(a,n1,p)
B <- t(A)%*%A
A.csr <- as.matrix.csr(A)
A.csc <- as.matrix.csc(A)
B.ssr <- as.matrix.ssr(B)
B.ssc <- as.matrix.ssc(B)
is.matrix.csr(A.csr) # -> TRUE
is.matrix.csc(A.csc) # -> TRUE
is.matrix.ssr(B.ssr) # -> TRUE
is.matrix.ssc(B.ssc) # -> TRUE
as.matrix(A.csr)
as.matrix(A.csc)
as.matrix(B.ssr)
as.matrix(B.ssc)
as.matrix.csr(rep(0,9),3,3) #sparse matrix of all zeros
as(4,"matrix.diag.csr") #identity matrix of dimension 4



