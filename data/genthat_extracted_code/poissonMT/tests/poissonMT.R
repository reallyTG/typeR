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
  Saved <- poissonMTinitial(x=cbind(1,x), y=y, start=c(0,beta))
  dput(Saved, file="poissonMT-savedvalues.R")
} else {
  poissonMTsetwd(tempdir())   
  Saved <- dget(file="poissonMT-savedvalues.R")
  Test <- poissonMTinitial(x=cbind(1,x), y=y, start=c(0,beta))
  stopifnot(
    all.equal(Saved, Test, tol = 2e-6)
  )
}
