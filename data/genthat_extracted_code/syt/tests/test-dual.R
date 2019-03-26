context("dual syt")

test_that("dual syt", {
  syt <- list(c(1,2,6), c(3,5), 4)
  dsyt <- dualsyt(syt)
  expect_identical(dsyt, list(c(1L,3L,4L),c(2L,5L),6L))
})
