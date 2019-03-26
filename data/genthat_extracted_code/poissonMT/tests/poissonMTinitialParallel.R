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
  Saved <- poissonMTinitialParallel(x=cbind(1,x), y=y)
  dput(Saved, file="poissonMTinitialParallel-savedvalues.R")
} else {
  poissonMTsetwd(tempdir())  
  Saved <- dget(file="poissonMTinitialParallel-savedvalues.R")
  Test <- poissonMTinitial(x=cbind(1,x), y=y)
  Test1 <- poissonMTinitialParallel(x=cbind(1,x), y=y)
##  Test2 <- poissonMTinitialParallel(x=cbind(1,x), y=y, parallel="multicore", ncpus=2)  
  stopifnot(
    all.equal(Saved, Test1, tol = 2e-6)
  )
  stopifnot(
    all.equal(Test, Test1, tol = 2e-6)
  )
}
