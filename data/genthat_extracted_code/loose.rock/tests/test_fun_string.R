context("Strings")

test_that("proper capitalizes all words", {
  x <- c('the frog saw an empty lake when he arrived', 'wHat in the Hell iS gOing on')
  z <- c('The Frog Saw An Empty Lake When He Arrived', 'What In The Hell Is Going On')

  expect_identical(proper(x[1]), z[1])
  expect_identical(proper(x[2]), z[2])
})
