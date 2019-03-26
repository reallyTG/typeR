context("gppm-summary")
test_that("unfitted", {
  utils::capture.output(print(summary(lgcm)))
  expect_equal(1,1)
})

test_that("fitted", {
  utils::capture.output(print(summary(lgcmFit)))
  expect_equal(1,1)
})



