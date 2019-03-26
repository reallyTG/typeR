context("growth process")

test_that("conversion to and from growth process", {
  path <- list(1L, 2L, c(2L,1L), c(3L,1L), c(3L,1L,1L))
  syt <- gprocess2syt(path)
  expect_identical(path, syt2gprocess(syt))
})
