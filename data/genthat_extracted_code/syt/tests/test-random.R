context("random syt")

test_that("random syt has good shape", {
  syt <- rsyt(c(5,3,1))
  expect_identical(lengths(syt), c(5L,3L,1L))
})
