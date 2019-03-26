library(irlba)


### Name: ssvd
### Title: Sparse regularized low-rank matrix approximation.
### Aliases: ssvd

### ** Examples


set.seed(1)
u <- matrix(rnorm(200), ncol=1)
v <- matrix(c(runif(50, min=0.1), rep(0,250)), ncol=1)
u <- u / drop(sqrt(crossprod(u)))
v <- v / drop(sqrt(crossprod(v)))
x <- u %*% t(v) + 0.001 * matrix(rnorm(200*300), ncol=300)
s <- ssvd(x, n=50)
table(actual=v[, 1] != 0, estimated=s$v[, 1] != 0)
oldpar <- par(mfrow=c(2, 1))
plot(u, cex=2, main="u (black circles), Estimated u (blue discs)")
points(s$u, pch=19, col=4)
plot(v, cex=2, main="v (black circles), Estimated v (blue discs)")
points(s$v, pch=19, col=4)

# Compare with SPC from the PMA package, regularizing only the v vector and choosing
# the regularization constraint `sum(abs(s$v))` computed above by ssvd
# (they find the about same solution in this "sparse SVD" case):
if (requireNamespace("PMA", quietly = TRUE)) {
  p <- PMA::SPC(x, sumabsv=sum(abs(s$v)), center=FALSE)
  table(actual=v[, 1] != 0, estimated=p$v[, 1] != 0)
  # compare optimized values
  print(c(ssvd=s$d, SPC=p$d))

  # Same example, but computing a "sparse PCA", again about the same results:
  sp <- ssvd(x, n=50, center=TRUE)
  pp <- PMA::SPC(x, sumabsv=sum(abs(sp$v)), center=TRUE)
  print(c(ssvd=sp$d, SPC=pp$d))
}


# Let's consider a trivial rank-2 example (k=2) with noise. Like the
# last example, we know the exact number of nonzero elements in each
# solution vector of the noise-free matrix. Note the application of
# different sparsity constraints on each column of the estimated v.
# Also, the decomposition is unique only up to sign, which we adjust
# for below.
set.seed(1)
u <- qr.Q(qr(matrix(rnorm(400), ncol=2)))
v <- matrix(0, ncol=2, nrow=300)
v[sample(300, 15), 1] <- runif(15, min=0.1)
v[sample(300, 50), 2] <- runif(50, min=0.1)
v <- qr.Q(qr(v))
x <- u %*% (c(2, 1) * t(v)) + .001 * matrix(rnorm(200 * 300), 200)
s <- ssvd(x, k=2, n=colSums(v != 0))

# Compare actual and estimated vectors (adjusting for sign):
s$u <- sign(u) * abs(s$u)
s$v <- sign(v) * abs(s$v)
table(actual=v[, 1] != 0, estimated=s$v[, 1] != 0)
table(actual=v[, 2] != 0, estimated=s$v[, 2] != 0)
plot(v[, 1], cex=2, main="True v1 (black circles), Estimated v1 (blue discs)")
points(s$v[, 1], pch=19, col=4)
plot(v[, 2], cex=2, main="True v2 (black circles), Estimated v2 (blue discs)")
points(s$v[, 2], pch=19, col=4)
par(oldpar)




