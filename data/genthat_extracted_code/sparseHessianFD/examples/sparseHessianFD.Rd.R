library(sparseHessianFD)


### Name: sparseHessianFD
### Title: sparseHessianFD
### Aliases: sparseHessianFD

### ** Examples

## Log posterior density of hierarchical binary choice model. See vignette.
set.seed(123)
data("binary_small")
N <- length(binary[["Y"]])
k <- NROW(binary[["X"]])
T <- binary[["T"]]
P <- rnorm((N+1)*k)
priors <- list(inv.Sigma = rWishart(1,k+5,diag(k))[,,1],
               inv.Omega = diag(k))
true.hess <- binary.hess(P, binary, priors)
pattern <- Matrix.to.Coord(Matrix::tril(true.hess))
str(pattern)
obj <- sparseHessianFD(P, fn=binary.f, gr=binary.grad,
       rows=pattern[["rows"]], cols=pattern[["cols"]],
                      data=binary, priors=priors)
hs <- obj$hessian(P)
all.equal(hs, true.hess)

f <- obj$fn(P) ## obj function
df <- obj$gr(P) ## gradient
fdf <- obj$fngr(P) ## list of obj function and gradient
fdfhs <- obj$fngrhs(P) ## list of obj function, gradient and Hessian.



