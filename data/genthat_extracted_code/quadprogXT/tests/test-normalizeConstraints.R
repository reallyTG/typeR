library(quadprogXT)

Amat <- cbind(diag(3), rep(11, 3))
diag(Amat) <- 1:3

test_that("column sums of A ^ 2 are equal to 1", {
    Anorm <- normalizeConstraints(Amat, bvec = rep(3, 4))
    expect_true(all.equal(colSums(Anorm$Amat ^ 2), rep(1, ncol(Amat))))
})

test_that("column sums of A ^ 2 are equal to 1", {
    Amat[ , 1] <- 0
    expect_error(normalizeConstraints(Amat, bvec = rep(3, 4)))
})

