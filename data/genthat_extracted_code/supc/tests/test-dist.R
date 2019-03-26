library(supc)
set.seed(1)
x <- matrix(0, 20, 20)
x[] <- rnorm(length(x))
system.time(d1 <- supc:::.test.dist(x))
system.time(d2 <- stats::dist(x))
max(abs(d1 - d2)) < sqrt(.Machine$double.eps)


x <- matrix(0, 200, 2000)
x[] <- rnorm(length(x))
system.time(d1 <- supc:::.test.dist(x))
system.time(d2 <- stats::dist(x))
max(abs(d1 - d2)) < sqrt(.Machine$double.eps)

