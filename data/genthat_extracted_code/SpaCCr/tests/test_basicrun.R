library(SpaCCr)
n <- 5
p <- 10
X <- matrix(rnorm(n*p),nrow=n)
w <- rep(1,times=p-1)
gamma <- .1
nu <- 1/n
verbose=FALSE
tol.base=1e-3
tol.miss=1e-2
max.iter.base=100
max.iter.miss=10
Uinit <- X
Vinit <- X[,-1]
Laminit <- Vinit
test_that('SpaCC_Missing runs',{
          expect_true(!is.null(SpaCC_Missing(X = X,
              w = w,
              gamma = gamma,
              nu = nu,
              verbose = verbose,
              tol.base = tol.base,
              tol.miss = tol.miss,
              max.iter.base = max.iter.base,
              max.iter.miss = max.iter.miss,
              Uinit = Uinit,
              Vinit = Vinit,
              Laminit = Laminit)))
  })
