context("fast marginal lm solver (mfastLmCpp)")


test_that("estimation", {
  expect_equal(mfastLmCpp(1:10, as.matrix(1:10))[1,1], 1)
})



test_that("Correct handling of missing", {
    expect_equal(mfastLmCpp(c(NA, 2:10), as.matrix(1:10)), mfastLmCpp(2:10, as.matrix(2:10)))
    expect_equal(mfastLmCpp(1:10, as.matrix(c(NA, 2:10))), mfastLmCpp(2:10, as.matrix(2:10)))
})
