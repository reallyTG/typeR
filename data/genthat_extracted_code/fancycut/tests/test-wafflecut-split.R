
context("Wafflecut Split Out")


test_that("wafflecut bare syntax", {
  x <- seq.int(0, 1, 0.25)
  y <- wafflecut(x, c('[0,0.5]', '(0.5, 1]'), c('low', 'high'))
  expect_equal(as.integer(y), c(1, 1, 1, 2, 2))
})


test_that("fancycut bare syntax", {
  x <- seq.int(0, 1, 0.25)
  y <- fancycut(x, low = '[0,0.5]', high = '(0.5, 1]')
  expect_equal(as.integer(y), c(1, 1, 1, 2, 2))
})


test_that("wafflecut syntax as character", {
  x <- c(-1, seq.int(0, 1, 0.25), NA)
  y <- wafflecut(
    x,
    c('[0,0.5]', '(0.5, 1]'),
    c('low', 'high'),
    out.as.factor = FALSE,
    na.bucket = 'N/A',
    unmatched.bucket = 'UNK'
  )
  expect_equal(y, c('UNK', 'low', 'low', 'low', 'high', 'high', 'N/A'))
})


test_that("wafflecut syntax as factor", {
  x <- c(-1, seq.int(0, 1, 0.25), NA)
  y <- wafflecut(
    x,
    c('[0,0.5]', '(0.5, 1]'),
    c('low', 'high'),
    out.as.factor = TRUE,
    na.bucket = 'N/A',
    unmatched.bucket = 'UNK'
  )
  expect_equal(as.character(y), c('UNK', 'low', 'low', 'low', 'high', 'high', 'N/A'))
})


test_that("fancycut syntax as character", {
  x <- c(-1, seq.int(0, 1, 0.25), NA)
  y <- fancycut(
    x,
    low = '[0,0.5]',
    high = '(0.5, 1]',
    out.as.factor = FALSE,
    na.bucket = 'N/A',
    unmatched.bucket = 'UNK'
  )
  expect_equal(y, c('UNK', 'low', 'low', 'low', 'high', 'high', 'N/A'))
})



test_that("fancycut syntax as factor", {
  x <- c(-1, seq.int(0, 1, 0.25), NA)
  y <- fancycut(
    x,
    low = ' [ 0 , 0.5 ]',
    high = ' ( 0.5 , 1] ',
    out.as.factor = TRUE,
    na.bucket = 'N/A',
    unmatched.bucket = 'UNK'
  )
  expect_equal(as.character(y), c('UNK', 'low', 'low', 'low', 'high', 'high', 'N/A'))
})


