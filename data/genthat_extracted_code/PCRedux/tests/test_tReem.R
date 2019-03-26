library(PCRedux)

context("tReem")

test_that("tReem performs the shape based clustering", {

  res_foo <- try(tReem("foo"), silent=TRUE)
  res_bar <- try(tReem("bar", cor=FALSE), silent=TRUE)

  expect_equal(class(res_foo), "try-error")
  expect_equal(class(res_bar), "try-error")
})
