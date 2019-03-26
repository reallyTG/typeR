context("read_regnie")

r <- read_regnie(system.file("extdata", "ra050120.gz", package = "esmisc"))

test_that('read_regnie works', {
  expect_is(r, "RasterLayer")
  expect_equal(nrow(r), 971)
  expect_equal(ncol(r), 611)
  expect_true(is.na(r[1]))
  expect_equivalent(r[438537], 109.1)
  expect_equivalent(r[100000], 5.7)
})

