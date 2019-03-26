context("test pairwise Schur product")

test_that("computations", {
    expect_equal(pairwise_Schur_product(cbind(rep(1, 4), 1:4, 4:1)), matrix(c(1:4,4:1, 4,6,6,4), ncol=3))
    expect_equal(pairwise_Schur_product(cbind(rep(1, 4), 1:4, 4:1), self=TRUE), matrix(c(1, 1, 1, 1, 1:4,4:1, 1, 4, 9, 16, 4,6,6,4, 16, 9, 4, 1), ncol=6))
} )


test_that("input and output is the right type and dimension", {
    # Input
    expect_error(pairwise_Schur_product(data.frame(rep(1, 4), 1:4, 4:1)))
    expect_error(pairwise_Schur_product(1:4))

    # Output type
    expect_is(pairwise_Schur_product(cbind(rep(1, 4), 1:4, 4:1)), "matrix")
    expect_is(pairwise_Schur_product(cbind(rep(1, 4), 1:4, 4:1), self=TRUE), "matrix")

    # Check dimensions
    expect_equal(dim(pairwise_Schur_product(cbind(rep(1, 4), 1:4, 4:1))), c(4,3))
    expect_equal(dim(pairwise_Schur_product(cbind(rep(1, 4), 1:4, 4:1), self=TRUE)), c(4,6))
} )

