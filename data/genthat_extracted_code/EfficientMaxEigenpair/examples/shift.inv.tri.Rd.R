library(EfficientMaxEigenpair)


### Name: shift.inv.tri
### Title: Shifted inverse iteration algorithm for Tridiagonal matrix
### Aliases: shift.inv.tri

### ** Examples

a = c(1:7)^2
b = c(1:7)^2
c = rep(0, length(a) + 1)
c[length(a) + 1] = 8^2
N = length(a)
Q = tridiag(b, a, -c(b[1] + c[1], a[1:N - 1] + b[2:N] + c[2:N], a[N] + c[N + 1]))
shift.inv.tri(Q, mu=rep(1,dim(Q)[1]), v0_tilde=rep(1,dim(Q)[1]), zstart=6,
 digit.thresh = 6)



