context("printing")

test_that("can override printing with proto_print", {
  x <- proto(proto_print = function(.) 10)
  out <- capture.output(print(x))[[1]]
  expect_match(out, "10")
})

test_that("default object prints as environment", {
  x <- proto()
  out <- capture.output(print(x))[[1]]
  expect_match(out, "environment")
})
