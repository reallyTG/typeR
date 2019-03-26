library(poissonMT)
set.seed(1234)
p <- 50
beta <- rep(1/p,p)
n <- 10*p
x <- matrix(rnorm(p*n,0,1), ncol=p)
eta <- x%*%beta
mu <- exp(eta)
y <- rpois(n, mu)

Test <- FALSE
if (!Test) {
  poissonMTsetwd(tempdir())   
  Saved <- poissonL2T(x=cbind(1,x), y=y)
  dput(Saved, file="poissonL2T-savedvalues.R")
} else {
  poissonMTsetwd(tempdir())   
  Saved <- dget(file="poissonL2T-savedvalues.R")
  Test <- poissonL2T(x=cbind(1,x), y=y)
  stopifnot(
    all.equal(Saved, Test, tol = 2e-6)
  )
}
