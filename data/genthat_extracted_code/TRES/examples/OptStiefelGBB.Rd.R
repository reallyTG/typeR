library(TRES)


### Name: OptStiefelGBB
### Title: Optimization on Stiefel manifold (GBB)
### Aliases: OptStiefelGBB

### ** Examples

fun <- function(X,  W) {
      G = -2*(W %*% X)
      F = -sum(diag(t(X) %*% W %*% X))
      return(list(F = F, G = G))
}
n = 1000; k = 6;
W = matrix(rnorm(n^2), n, n); W = t(W) %*% W

opts=c()
opts$record = 0;
opts$mxitr  = 1000;
opts$xtol = 1e-5;
opts$gtol = 1e-5;
opts$ftol = 1e-8;

X0 = matrix(rnorm(n*k), n, k);
X0 = qr.Q(qr(X0));

eva <- OptStiefelGBB(X0, opts, fun, W)
X <- eva$X
out <- eva$out
out$fval = -2*out$fval;




