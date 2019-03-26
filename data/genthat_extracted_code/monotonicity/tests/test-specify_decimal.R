context('functions')

test_that('specify_decimal', {

  # round off positive number
  expect_equal(as.numeric(specify_decimal(3.45178,2)), 3.45)

  # round up positive number
  expect_equal(as.numeric(specify_decimal(3.45678,2)), 3.46)

  # round off negative number
  expect_equal(as.numeric(specify_decimal(-3.45178,2)), -3.45)

  # round up negative number
  expect_equal(as.numeric(specify_decimal(-3.45678,2)), -3.46)


})
