
 set.seed(42)

 library(rcdd)

 d <- 10
 n <- 5
 foo <- matrix(rnorm(d * n), d)

 bar <- qgram(foo)

 baz <- qmatmult(t(bar), bar)
 all(baz[row(baz) != col(baz)] == "0")

 all(apply(qabs(bar), 2, qsum) == "1")

