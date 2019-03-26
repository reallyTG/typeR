library(testthat)

context('General tests')

x <- runif(1000)*10^runif(1000, min=1e-20, max=20)

test_that('Zero values are left alone', {
  expect_equal(0, squeeze_bits(0, 1, method='trim'))
  expect_equal(0, squeeze_bits(0, 1, method='pad'))
})

test_that('Infinite values are left alone', {
  expect_equal(Inf, squeeze_bits(Inf, 1, method='trim'))
  expect_equal(Inf, squeeze_bits(Inf, 1, method='pad'))
  expect_equal(-Inf, squeeze_bits(-Inf, 1, method='trim'))
  expect_equal(-Inf, squeeze_bits(-Inf, 1, method='pad'))
})

test_that('NA values are left alone', {
  expect_equal(NA_real_, squeeze_bits(NA_real_, 1, method='trim'))
  expect_equal(NA_real_, squeeze_bits(NA_real_, 1, method='pad'))
})

test_that('We ignore trimming when the tolerance is too small', {
  z <- pi*1e15

  # Can't preserve 3 decimal places when we have 15 digits to the left
  # of the decimal point.
  expect_equal(z, squeeze_bits(z, 3, method='trim', decimal=TRUE))

  # Can't preserve 17 significant digits when we only have ~15 to start with.
  expect_equal(x, squeeze_bits(x, 17, method='trim', decimal=FALSE))
})

test_that('Trimmed values biased low and within specified tolerance', {
  for (i in 1:15) {
    trimmed <- squeeze_bits(x, i, method='trim', decimal=FALSE)

    expect_true(all(trimmed <= x))
    expect_true(all(abs(trimmed - x)/x < 10^-i))
  }
})

test_that('Values can be trimmed using a decimal digits tolerance', {
  for (i in -15:15) {
    trimmed <- squeeze_bits(x, i, method='trim', decimal=TRUE)

    expect_true(all(trimmed <= x))
    expect_true(all(abs(trimmed - x) < 10^-i))
  }
})

test_that('Values can be padded using a decimal digits tolerance', {
  for (i in -15:15) {
    padded <- squeeze_bits(x, i, method='pad', decimal=TRUE)

    expect_true(all(padded >= x))
    expect_true(all(abs(padded - x) < 10^-i))
  }
})

test_that('Padded values biased high and within specified tolerance', {
  for (i in 1:15) {
    padded <- squeeze_bits(x, i, method='pad', decimal=FALSE)
    expect_true(all(padded >= x))
    expect_true(all(abs(padded-x)/x < 10^-i))
  }
})

test_that('Groomed values are within specified tolerance', {
  for (i in 1:15) {
    groomed <- squeeze_bits(x, i, method='groom', decimal=FALSE)
    expect_true(all(abs(groomed-x)/x < 10^-i))
  }
})
