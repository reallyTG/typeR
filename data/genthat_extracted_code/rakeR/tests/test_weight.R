context("Test weight() function produces correct output")

cons <- readr::read_csv("../cakemap_cons.csv")
inds <- readr::read_csv("../cakemap_inds.csv")
vars <- c("Car", "NSSEC8", "ageband4")

weights <- weight(cons = cons, inds = inds, vars = vars)

test_that("Ncols should equal number of zones in cons", {
  expect_equal(ncol(weights), nrow(cons))
})
test_that("Nrows should equal number of individuals in survey", {
  expect_equal(nrow(weights), nrow(inds))
})
test_that("Populations match (i.e. sum weights == (sum cons / n vars))", {
  expect_equal(sum(weights), (sum(cons[, -1]) / length(vars)))
  # Drop first column because it contains zone numbers
})
test_that("individual IDs stored in rownames of weights", {
  expect_equal(rownames(weights), inds[[1]])
})
