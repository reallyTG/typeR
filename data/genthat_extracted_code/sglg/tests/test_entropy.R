context("Length of the value returned by the entropy() function.")

test_that("test if entropy() returns a numerical value", {
    expect_length(entropy(), 1)
})
