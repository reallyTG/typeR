
context("Construction and initialisation of lvec")

test_that("vectors are correctly initialised", {
  a <- lvec(4, "integer")
  expect_that(as_rvec(a), equals(c(0, 0, 0, 0)))

  a <- lvec(4, "numeric")
  expect_that(as_rvec(a), equals(c(0.0, 0.0, 0.0, 0.0)))

  a <- lvec(4, "logical")
  expect_that(as_rvec(a), equals(c(FALSE, FALSE, FALSE, FALSE)))

  a <- lvec(4, "character", strlen = 4)
  expect_that(as_rvec(a), equals(c("", "", "", "")))

  # Edge cases
  expect_error(lvec(as.integer(NA), "integer"))
  expect_error(lvec(as.double(NA), "integer"))
  expect_error(lvec(as.character(NA), "integer"))
  expect_error(lvec(as.double(-10), "integer"))
  expect_error(lvec(integer(0), "integer"))
  expect_error(lvec(1,01E15))
  expect_error(lvec(1, "character", strlen = NA))
})


