##

context('Coercion')

library(stats)
set.seed(1234)
x <- rnorm(100)

pd <- stats::spectrum(x, plot=FALSE)
pc <- psdcore(x, plot = FALSE, verbose = FALSE)
pa <- pspectrum(x, plot = FALSE, verbose = FALSE)

test_that("can convert to list", {
  
  expected <- 'list'

  expect_is(as.list(pd), expected)
  expect_is(as.list(pc), expected)
  expect_is(as.list(pa), expected)
  
})

test_that("can convert to data.frame", {
  
  expected <- 'data.frame'

  expect_is(as.data.frame(pd), expected)
  expect_is(as.data.frame(pc), expected)
  expect_is(as.data.frame(pa), expected)
  
})

test_that("can convert to matrix", {
  
  expected <- 'matrix'

  expect_is(as.matrix(pd), expected)
  expect_is(as.matrix(pc), expected)
  expect_is(as.matrix(pa), expected)
  
})

test_that('expected attribute retention', {
  spdc <- spec_details(pc)
  dc <- as.data.frame(pc)
  expect_equal(spdc, attr(dc,'spec.details'))
})

##