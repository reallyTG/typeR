context("Simulating endpoint conditioned CTMC paths")

# This function merely executes a basic t test at a set of discrete times to
# check that the state at those times is not different when simulating using
# uniformization and modified rejection sampling. A full test comparing these
# algorithms to sample paths produced by the GillespieSSA package (endpoint
# conditioned simple rejection sampling) is available as an commented extended R
# script in the /tests directory of this package.

test_that("sampling does not fail if rowSums is within the rounding point error of zero, but not exactly zero", {
        set.seed(1)
        Q <- matrix(abs(rnorm(9)),3,3)
        diag(Q) <- 0
        diag(Q) <- -rowSums(Q)
        expect_silent(sample_path(1, 1, 1, 2, Q))
})

test_that("sampling does fail if rowSums is not within the rounding point error of zero", {
        set.seed(1)
        Q <- matrix(abs(rnorm(9)),3,3)
        diag(Q) <- 0
        diag(Q) <- -rowSums(Q)
        Q[1,1] <- Q[1,1] + sqrt(.Machine$double.eps)*10
        all.equal(rowSums(Q), rep(0, nrow(Q)))
        expect_error(sample_path(1, 1, 1, 2, Q))
})
