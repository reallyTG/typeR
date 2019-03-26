library(ddalpha)


### Name: depth.sample
### Title: Fast Depth Computation for Univariate and Bivariate Random
###   Samples
### Aliases: depth.sample
### Keywords: depth

### ** Examples

n = 100
m = 150
A = matrix(rnorm(2*n),ncol=2)
B = matrix(rnorm(2*m),ncol=2)
depth.sample(A,B)
system.time(D1<-depth.halfspace(A,B))
system.time(D2<-depth.sample(A,B))
max(D1-D2$Half)

A = rnorm(100)
B = rnorm(150)
depth.sample(A,B)
# depth.halfspace(matrix(A,ncol=1),matrix(B,ncol=1))




