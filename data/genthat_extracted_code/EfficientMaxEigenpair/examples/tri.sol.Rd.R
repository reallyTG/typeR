library(EfficientMaxEigenpair)


### Name: tri.sol
### Title: Solve the linear equation (-Q-zI)w=v.
### Aliases: tri.sol

### ** Examples

a = c(1:7)^2
b = c(1:7)^2
c = rep(0, length(a) + 1)
c[length(a) + 1] = 8^2
N = length(a)
zstart = 6
Q = tridiag(b, a, -c(b[1] + c[1], a[1:N - 1] + b[2:N] + c[2:N], a[N] + c[N + 1]))
tri.sol(Q, z=zstart, v=rep(1,dim(Q)[1]))



