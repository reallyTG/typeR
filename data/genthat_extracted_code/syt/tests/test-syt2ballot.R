context("conversion to and from ballot sequence")

test_that("syt2ballot", {
  v <- c(1L,1L,2L,3L,2L,1L)
  syt <- ballot2syt(v)
  w <- syt2ballot(syt)
  expect_identical(v, w)
  expect_identical(syt, list(c(1L,2L,6L),c(3L,5L),4L))
})
