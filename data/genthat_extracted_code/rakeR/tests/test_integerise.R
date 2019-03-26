context("Test integerise function")

cons <- readr::read_csv("../cakemap_cons.csv")
inds <- readr::read_csv("../cakemap_inds.csv")
vars <- c("Car", "NSSEC8", "ageband4")

weights <- weight(cons = cons, inds = inds, vars = vars)
weights_int <- integerise(weights, inds)

test_that("Sum of input weights should equal number of integerised cases", {
  expect_equal(sum(weights), nrow(weights_int))
})

test_that("correct number of zones in integerised data", {
  expect_equal(length(unique(weights_int[["zone"]])), nrow(cons))
})

test_that("integerised weights should add up to cons population", {
  expect_equal(nrow(weights_int), (sum(cons[, -1] / length(vars))))
})
