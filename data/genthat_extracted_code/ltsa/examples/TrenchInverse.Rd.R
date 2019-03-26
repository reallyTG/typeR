library(ltsa)


### Name: TrenchInverse
### Title: compute the matrix inverse of a positive-definite Toepliz matrix
### Aliases: TrenchInverse
### Keywords: ts array

### ** Examples

#compute inverse of matrix and compare with result from solve
data(LakeHuron)
r<-acf(LakeHuron, plot=FALSE, lag.max=4)$acf
R<-toeplitz(c(r))
Ri<-TrenchInverse(R)
Ri2<-solve(R)
Ri
Ri2

#invert a matrix of order n and compute the maximum absolute error
# in the product of this inverse with the original matrix
n<-5	   
r<-0.8^(0:(n-1))
G<-toeplitz(r)
Gi<-TrenchInverse(G)
GGi<-crossprod(t(G),Gi)
id<-matrix(0, nrow=n, ncol=n)
diag(id)<-1
err<-max(abs(id-GGi))
err



