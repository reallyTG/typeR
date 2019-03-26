context("Parameter Combinations")

x1 <- c(
  "I", "P", "I", "NC", "UH", "I", "R", "UO",
  "I", "O", "P", "I", "R", "O", "P", "NE"
)

test_that("Rates not requiring 'e' should work without it", {
  expect_equal(outcomerate(x1, e = NA, rate = "LOC1"), c(LOC1 = 13 / 15))
})

test_that("Output must be named vector", {
  expect_named(outcomerate(x1, rate = "RR1"), expected = "RR1")
})

test_that("outcomerate should not work if 'e' is not numeric", {
  msg <- "The parameter e must be numeric"
  expect_error(outcomerate(x1, e = "none"), regexp = msg)
})

test_that("outcomerate should only work if 'e' is on the interval [0, 1]", {
  msg <- "parameter e must be on the interval"
  expect_error(outcomerate(x1, e = -4), regexp = msg)
  expect_error(outcomerate(x1, e = 1.5), regexp = msg)

  # expect success via NA
  expect_error(outcomerate(x1, e = 0), NA)
  expect_error(outcomerate(x1, e = 1), NA)
})

test_that("outcomerate should not work if 'e' is not a scalar", {
  msg <- "The parameter e must be a scalar value"
  expect_error(outcomerate(x1, e = c(0.3, 0.5)), regexp = msg)
})

test_that("outcomerate should fail if foreign dispositions are used", {
  msg <- "contains NA values"
  expect_error(outcomerate(c("I", NA_character_)), regexp = msg)

  msg <- "Certain names in 'x' are not valid"
  expect_error(outcomerate(c("I", "ABC"), e = .4), regexp = msg)
  expect_error(outcomerate(c(I = 4, ABC = 3, Z = 1)), regexp = msg)
})

test_that("outcomerate should fail if weight is different length than x", {
  msg <- "weight must be same length as"
  expect_error(outcomerate(x1, weight = rnorm(5)), regexp = msg)
})

test_that("outcomerate should fail if rates are not in the recognized set", {
  msg <- "following rates are not recognized"
  expect_error(outcomerate(x1, rate = "ABC"), regexp = msg)
})

test_that("outcomerate should fail if 'e' missing for given rates", {
  msg <- "require the parameter 'e' to be defined"
  expect_error(outcomerate(x1, rate = "RR3"), regexp = msg)
})

test_that("Element ordering in tables should not influence result", {
  tab1 <- table(x1)
  tab2 <- rev(tab1)
  expect_equal(outcomerate(tab1), outcomerate(tab2))
})

test_that("Element ordering in named vectors should not influence result", {
  freq1 <- c(I = 4, P = 2, R = 1, NC = 1, O = 1, UH = 1, UO = 1, NE = 1)
  freq2 <- sample(freq1)
  expect_equal(outcomerate(freq1), outcomerate(freq2))
})

test_that("A warning should be given if ELR is calculated with no NE's", {
  msg <- "No 'NE' values found"
  expect_warning(eligibility_rate(setdiff(x1, "NE")), regexp = msg)
})

test_that("outcomerate should fail if 'x' is numeric and is unnamed", {
  msg1 <- "should be a named vector"
  msg2 <- "All elements in 'x' should be named"

  expect_error(outcomerate(3:7), regexp = msg1)
  expect_error(outcomerate(c(I = 5, 4)), regexp = msg2)
})

test_that("outcomerate weights should not include zeros or NAs", {
  msg1 <- "weights contain contain zeros"
  msg2 <- "weights must not contain NA values"
  w1 <- w2 <- rnorm(length(x1), 5)
  w1[1] <- 0
  w2[1] <- NA

  expect_warning(outcomerate(x1, weight = w1), regexp = msg1)
  expect_error(outcomerate(x1, weight = w2), regexp = msg2)
})


