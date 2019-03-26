context("trios - functions for handling id, fid, mid trio information")

## Check output is correct and has not changed
test_that("identify family clusters", {
    id <- 1:11
    fid <- c(NA, NA, 1, 1, NA, 23, 45, 5, 5, 7, NA)
    mid <- c(NA, NA, 2, 2, 65, NA, 46, 6, 6, 6, 0)
    res <- make_family_id(id, fid, mid)
    
    expect_is(res, "integer")
    expect_equal(length(res), length(id))
    expect_equal(res, c(1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 3L))
})


test_that("trios - consistency", {
    id <- 1:11
    fid <- c(NA, NA, 1, 1, NA, 23, 45, 5, 5, 7, NA)
    mid <- c(NA, NA, 2, 2, 65, NA, 46, 6, 6, 6, 0)

    expect_error(validate_trio_consistency(id, fid, mid), "some individuals")

    id <- 1:12
    fid <- c(NA,  0, 1, 1, NA, 23, 45, 5, 5, 7, 10, 10)
    mid <- c(NA, NA, 2, 2,  0, 56, 46, 6, 6, 6, 9, 11)
    sex <- c( 1,  2, 1, 2,  1,  2, 1, 2, 1, 2, 1, 2)

    expect_equal(validate_trio_consistency(id, fid, mid), TRUE)

    expect_error(validate_trio_consistency(id, fid, mid, sex), "some individuals")

    sex <- c( 1,  2, 1, 2,  1,  2, 1, 2, 2, 1, 2, 2)

    expect_equal(validate_trio_consistency(id, fid, mid, sex), TRUE)
})

