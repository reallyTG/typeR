context("internal")

test_that("quantiles", {
  quantiles <- quantiles(1:10, 0.95)
  expect_identical(names(quantiles), c("estimate", "lower", "upper"))
  expect_equal(quantiles, c(5.5, 1.225, 9.775), check.attributes = FALSE)
})

test_that("sanitize", {
  expect_identical(sanitize(c(-1, NaN, 1)), c(0, 0, 1))
})

test_that("sum_fish", {
  expect_equal(sum_fish(data.frame(Age = 1:4, Count = 1:4)),
                   data.frame(Age = 2.5, Count = 10))
})

