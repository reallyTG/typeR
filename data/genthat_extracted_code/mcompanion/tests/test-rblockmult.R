
test_that("rblockmult works correctly", {
    ## expect_that( rblockmult(matrix(1, nrow = 4, ncol = 10),
    ##                         matrix(1, nrow = 4, ncol = 4))
    ##             , throws_error())

    expect_error( rblockmult(matrix(1, nrow = 4, ncol = 10),
                             matrix(1, nrow = 4, ncol = 4))
                 )

    x <- matrix(1, nrow = 4, ncol = 12)
    b <- diag(4)
    expect_that(rblockmult(x, b), equals(x))

})

