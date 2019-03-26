context("create_s3_methods")

a <- structure(1:10, class = c("b", "numeric"))
d <- structure(10, class = c("b", "numeric"))
`[.b` <- create_s3_method("[")
max.b <- create_s3_method("max")

test_that("create_s3_methods", {
  expect_is(a[1], "b")  
  expect_equivalent(max(a), d)
})
