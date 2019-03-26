
context("specify_missing")

test_that("specify_missing", {
  expect_that(specify_missing(1:8), is_equivalent_to(1:8))
  expect_that(specify_missing(1:8, 5), is_equivalent_to(c(1:4, NA, 6:8)))
  expect_that(specify_missing(c(NA, "", "apa    ", "        ", "hej")), 
              is_equivalent_to(c(NA, NA, "apa    ", NA, "hej")))
})



