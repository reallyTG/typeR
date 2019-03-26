
context("Length of the list that is returned by the lss() function.")

test_that("test if lss() returns a list of length 4", {
    expect_length(lss(), 4)
})
