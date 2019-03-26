context("metapred 0. formula functions")

# necessary for testing
f0    <- formula(y ~ 1)
fa    <- formula(y ~ a)
fab   <- formula(y ~ a + b)
fabc  <- formula(y ~ a + b + c)
fab0  <- formula(y ~ a + b - 1)
faxb  <- formula(y ~ a * b)
fab2  <- formula(y ~ a + I(b^2))
fabb2 <- formula(y ~ a + I(b^2) + b) # Reordered, for testing purposes
fapb  <- formula(y ~ I(a+b))
# fabc  <- formula(y ~ a + b + strata(c)) # future functionality

# utility function for obtaining terms (predictors, or interactions etc) of formula
test_that("terms can be obtained", {
  expect_true(all(f2tl(fab0) == c("a", "b")))
  expect_false(any(f2tl(fab) == c("b", "a"))) # sadly gives false, 
  expect_true(all(c("b", "a") %in% f2tl(fab))) # that's why %in% is used internally.
  
  expect_true(f2o(fabb2) == "y")
  expect_true(f2o(f0) == "y")
})
   
# Add predictors
test_that("terms can be added", {
  expect_equal(updateFormula(f0, "a"), fa)
  expect_equal(updateFormula(fa, "b"), fab)
  expect_equal(updateFormula(fa, c("b", "c")), fabc)
  expect_equal(updateFormula(fab0, 1), fab)
  expect_equal(updateFormula(fab2, "b"), fabb2)
  expect_equal(updateFormula(f0, "I(a+b)"), fapb)
})

# Remove predictors
test_that("terms can be removed", {
  expect_equal(updateFormula(fab, c("a", "b")), f0)
  expect_equal(updateFormula(fab, "b"), fa)
  expect_equal(updateFormula(fa, "a"), f0)
  expect_equal(updateFormula(fabb2, "b"), fab2)
  expect_equal(updateFormula(fabb2, "I(b^2)"), fab)
  #expect_equal(updateFormula(fab0, c("a", "b")))  # a no intercept-model without predictors gets a bugged formula :(
})

# Error flagging
test_that("error is raised when terms are added and removed", {
  expect_error(updateFormula(fab, c("z", "b"))) # error, as intended
})

# # Multiple updates
# test_that("Multiple updates can be done", {
#   expect_length(updatesFormula(f, c("m", "n")), 2)
#   expect_type(updatesFormula(f, c("m", "n")), "list")
#   expect_type(updatesFormula(f, c("m", "n"))[[1]], "language")
# })

# necessary for testing
axb <- f2tl(faxb)
ab <- f2tl(fab)
abb2 <- f2tl(fabb2)

# Differences in vectors of characters
test_that("The difference in vectors is given", {
  expect_equal(setSymDiff(ab, axb), "a:b")
  expect_equal(setSymDiff(abb2, ab), "I(b^2)")
  expect_equal(setSymDiff(abb2, axb), c("a:b", "I(b^2)"))
  expect_length(setSymDiff(ab, ab), 0L)
})

# Differences in formulas, as character vectors.
test_that("The difference in formulas is given", {
  expect_equal(getFormulaDiffAsChar(f0, fabb2), c("a", "b", "I(b^2)"))
  expect_equal(getFormulaDiffAsChar(fabb2, fabb2), character()) # or length() == 0
  expect_equal(getFormulaDiffAsChar(faxb, fabb2), c("a:b", "I(b^2)"))
})
















