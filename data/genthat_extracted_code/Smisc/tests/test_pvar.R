context("pvar()")

test_that("pvar() returns values as expected", {

  w <- NULL
  x <- 10.7775
  y <- "text"
  z <- FALSE

  expect_output(pvar(w, x, y, z), "w = NULL; x = 10.7775; y = text; z = FALSE")
  expect_output(pvar(x, y, digits = 2), "x = 10.78; y = text")
  expect_output(pvar(w, y, x, z, abbrev = 2, digits = 3), "w = NU; y = te; x = 10.777; z = FALSE")
  expect_output(pvar(y, x, z, abbrev = 2, digits = 3, sep = "k"), "y = tek x = 10.777k z = FALSE")
  expect_identical(pvar(x, y, verbose = FALSE, digits = 1), c("x = 10.8; y = text"))
  expect_identical(pvar(list(x = x, y = y), verbose = FALSE, digits = 1), c("x = 10.8; y = text"))
  
})

test_that("pvar() returns erros as expected", {

  x <- 10
  y <- "text"
  
  # digits
  expect_error(pvar(x, digits = "7"), "'digits' must be")
  expect_error(pvar(x, digits = c(7, 2)), "'digits' must be")
  expect_error(pvar(x, digits = 2.1), "'digits' must be")

  # abbrev
  expect_error(pvar(y, abbrev = "7"), "'abbrev' must be")
  expect_error(pvar(y, abbrev = c(7, 2)), "'abbrev' must be")
  expect_error(pvar(y, abbrev = 2.1), "'abbrev' must be")
  expect_error(pvar(y, abbrev = -1), "'abbrev' must be")
    
})
