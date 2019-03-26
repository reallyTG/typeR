library("testthat")
library("qap")

p <- read_qaplib(system.file("qaplib", "had12.dat", package="qap"))
n <- nrow(p$A)

a <- qap(p$A, p$B)

### check permutation
expect_equal(length(a), n)
expect_equal(sort(a), 1:n)

