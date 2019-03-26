context('RENAVAN')

test_that('it should instanciate a RENAVAN', {
  x <- RENAVAN("75320797785")
  expect_is(x, 'RENAVAN')
  x <- RENAVAN(75320797785)
  expect_is(x, 'RENAVAN')
  x <- RENAVAN(c(75320797785, 91671999129, 60885589380))
  expect_is(x, 'RENAVAN')
})

test_that('it should not instanciate a RENAVAN', {
  expect_error(RENAVAN(NULL), 'Unsupported type')
})

test_that('it should check how RENAVAN is stored internally', {
  x <- RENAVAN("68194359406")
  expect_equal(unclass(x), "68194359406")
  x <- RENAVAN(1239157673)
  expect_equal(unclass(x), "01239157673")
  x <- RENAVAN(c("68194359406", "01239157673", "52008275582"))
  expect_equal(unclass(x), c("68194359406", "01239157673", "52008275582"))
})

test_that('it should format RENAVAN', {
  x <- RENAVAN("68194359406")
  expect_equal(format(x), "68194359406")
  x <- RENAVAN(1239157673)
  expect_equal(format(x), "01239157673")
  x <- RENAVAN(c(68194359406, 1239157673, 52008275582))
  expect_equal(format(x), c("68194359406", "01239157673", "52008275582"))
})

test_that('it should convert RENAVAN into numeric', {
  x <- RENAVAN("68194359406")
  expect_equal(as.numeric(x), 68194359406)
  x <- RENAVAN("01239157673")
  expect_equal(as.numeric(x), 1239157673)
  x <- RENAVAN(c("68194359406", "01239157673", "52008275582"))
  expect_equal(as.numeric(x), c(68194359406, 1239157673, 52008275582))
})

test_that('it should convert RENAVAN into character', {
  x <- RENAVAN(68194359406)
  expect_equal(as.character(x), "68194359406")
  x <- RENAVAN(1239157673)
  expect_equal(as.character(x), "01239157673")
  x <- RENAVAN(c(68194359406, 1239157673, 52008275582))
  expect_equal(as.character(x), c("68194359406", "01239157673", "52008275582"))
})

test_that('it should RENAVAN`s equality', {
  x <- RENAVAN(68194359406)
  expect_true(x == 68194359406)
  expect_true(x == "68194359406")
  expect_false(x != "68194359406")
  expect_false(x == "01239157673")
  expect_true(x != 1239157673)
  x <- RENAVAN(c(68194359406, 1239157673, 52008275582))
  expect_true(all( x == c("68194359406", "01239157673", "52008275582") ))
})

test_that('it should validate RENAVAN', {
  x <- RENAVAN(75320797785)
  expect_true(is.valid(x))
  x <- RENAVAN(91671999129)
  expect_true(is.valid(x))
  x <- RENAVAN(68194359405)
  expect_false(is.valid(x))
  x <- RENAVAN(c(75320797785, 91671999129))
  expect_true(all(is.valid(x)))
  x <- RENAVAN(c(75320797785, 42752486198))
  expect_equal(is.valid(x), c(T, F))
})

