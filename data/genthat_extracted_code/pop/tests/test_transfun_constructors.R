context('transfun-constructors')

test_that('transfun constructors work', {

  # ~~~~~~~~~~
  # probability

  # alias works
  expect_equal(p, probability)

  # invalid values
  expect_error(p(0))
  expect_error(p(1))
  expect_error(p(1.1))
  expect_error(p(-0.1))
  expect_error(p(NA))
  expect_error(p(NULL))
  expect_error(p(-Inf))
  expect_error(p(Inf))

  # valid values
  expect_error(p(.Machine$double.eps), NA)
  expect_error(p(1 - .Machine$double.eps), NA)

  prob <- p(0.5)

  # check they have the right class
  expect_s3_class(prob, c('transfun', 'probability', 'function'))

  # check is.probability works
  expect_true(is.probability(prob))
  expect_false(is.probability(list()))
  expect_false(is.probability(NA))
  expect_false(is.probability(NULL))
  expect_false(is.probability(r(3)))

  # check as.probability works
  obj1 <- pop:::as.probability(list())
  obj2 <- pop:::as.probability(NA)
  obj3 <- pop:::as.probability(Inf)
  expect_s3_class(obj1, 'probability')
  expect_s3_class(obj2, 'probability')
  expect_s3_class(obj3, 'probability')

  # ~~~~~~~~~~
  # rate

  # alias works
  expect_equal(r, rate)

  # invalid values
  expect_error(r(0))
  expect_error(r(-0.1))
  expect_error(r(-Inf))
  expect_error(r(Inf))
  expect_error(r(NA))
  expect_error(r(NULL))

  # valid values
  expect_error(r(.Machine$double.eps), NA)

  ra <- r(3)

  # check they have the right class
  expect_s3_class(ra, c('transfun', 'rate', 'function'))

  # check is.probability works
  expect_true(is.rate(ra))
  expect_false(is.rate(list()))
  expect_false(is.rate(NA))
  expect_false(is.rate(NULL))
  expect_false(is.rate(p(0.5)))

  # check as.rate works
  obj1 <- pop:::as.rate(list())
  obj2 <- pop:::as.rate(NA)
  obj3 <- pop:::as.rate(Inf)
  expect_s3_class(obj1, 'rate')
  expect_s3_class(obj2, 'rate')
  expect_s3_class(obj3, 'rate')


})
