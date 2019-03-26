library(supc)
set.seed(1)
a <- matrix(rnorm(25), 5, 5)
b <- matrix(rnorm(25), 5, 5)
retval <- matrix(0.0, 5, 5)
supc:::.test.dgemm(a, b, retval);
stopifnot(isTRUE(all.equal(a %*% b, retval)))
