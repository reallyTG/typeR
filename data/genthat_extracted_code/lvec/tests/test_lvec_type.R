
context("Get type of lvec")

test_that("getting type of lvec works", {
  expect_that(lvec_type(lvec(10, "integer")), equals("integer"))
  expect_that(lvec_type(lvec(10, "numeric")), equals("numeric"))
  expect_that(lvec_type(lvec(10, "logical")), equals("logical"))
  expect_that(lvec_type(lvec(10, "character", strlen = 5)), equals("character"))
  expect_error(lvec_type(1:10))
})

