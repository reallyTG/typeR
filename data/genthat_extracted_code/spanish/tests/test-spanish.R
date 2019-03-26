context("requests")

test_that("to_number returns integer from string.", {
  result <- to_number("mil doscientos treinta y cuatro")

  expect_type(result, "integer")
})


test_that("to_number returns a correct translation from string.", {
  result <- to_number("mil doscientos treinta y cuatro")
  target <- 1234
  expect_equivalent(result, target)
})


test_that("to_number works ok with millions from string.", {
  result <- to_number("dos millones cuatrocientos ochenta y dosmil ciento tres")
  target <- 2482103
  expect_equivalent(result, target)
})


test_that("to_number error message when unexpected string.", {

  expect_error(to_number("Esto no es un numero, ya ves."), "*unexpected input*")
})
