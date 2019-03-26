library(testthat)
context("test_invertpmultinom")

# A normal case that I can mutate into edge and error cases:
invert.pmultinom(lower=c(0,0,0), probs=c(1/3, 1/3, 1/3), target.prob=.95, method="exact")
invert.pmultinom(lower=c(0,0,0), probs=c(1/3, 1/3, 1/3), target.prob=c(.25, .5, .75), method="exact")

## EDGE CASES
test_that("invert.pmultinom behaves correctly with one category", {
  # With one category, the number of items in the category will be equal to the
  # size. So, the size required to achieve any non-zero probability of exceeding a
  # lower bound will be the lower bound plus one.
  expect_equal(invert.pmultinom(lower=0, probs=1, target.prob=.95, method="exact"), 1)
  expect_equal(invert.pmultinom(lower=1, probs=1, target.prob=.95, method="exact"), 2)
  expect_equal(invert.pmultinom(lower=2, probs=1, target.prob=.95, method="exact"), 3)
  # For an upper bound, the the probability of meeting it will be 1 for any size
  # below or equal the bound, and 0 after. So we expect a result of the upper
  # bound plus one.
  expect_equal(invert.pmultinom(upper=0, probs=1, target.prob=.95, method="exact"), 1)
  expect_equal(invert.pmultinom(upper=1, probs=1, target.prob=.95, method="exact"), 2)
  expect_equal(invert.pmultinom(upper=2, probs=1, target.prob=.95, method="exact"), 3)
})

test_that("Correct behavior when target probability is 0 or 1", {
  # Here, we can get a 0 probability even with 0 observations, so the answer should be 0
  expect_equal(invert.pmultinom(lower=c(-1, -1), probs=c(.5, .5), target.prob=0, method="exact"), 0)
  # Same here
  expect_equal(invert.pmultinom(lower=c(3, -1), probs=c(.5, .5), target.prob=0, method="exact"), 0)
  # But if we try to decrease down to zero, the condition is actually impossible
  # to satisfy. So you end up with an infinite loop. There should be an error.
  # Actually, what seems to happen in practice is you get an answer which achieves
  # a probability of effectively zero, which I actually prefer to the behavior I
  # expected.
  #invert.pmultinom(upper=c(5, 5), probs=c(.5, .5), target.prob=0, method="exact")
  # Similar to the cases specifying lower, with upper and target.prob=1, the
  # answer should be 0
  expect_equal(invert.pmultinom(upper=c(5, 5), probs=c(.5, .5), target.prob=1, method="exact"), 0)
})

test_that("Sample size of 0 required for conditions which are logically necessary", {
  expect_equal(invert.pmultinom(lower=c(-1,-1), probs=c(.5, .5), target.prob=.95, method="exact"), 0)
  expect_equal(invert.pmultinom(upper=c(Inf,Inf), probs=c(.5, .5), target.prob=.95, method="exact"), 0)
})

test_that("Correct output when upper bounds are all zero", {
  expect_equal(invert.pmultinom(upper=c(0,0), probs=c(.5, .5), target.prob=1, method="exact"), 0)
  expect_equal(invert.pmultinom(upper=c(0,0), probs=c(.5, .5), target.prob=.95, method="exact"), 1)
})

## ERRORS
test_that("Impossible to satisfy conditions are handled properly", {
  expect_error(invert.pmultinom(lower=c(0,1), probs=c(1,0), target.prob=.95, method="exact"), "infinite loop")
  # This one gives an error for a different reason, currently (upper and lower
  # can't be simultaneously given), but when they can, this will have to still
  # give an error:
  expect_error(invert.pmultinom(lower=c(0, -1), upper=c(0, -1), probs=c(.5, .5), target.prob=.95, method="exact"))
})

test_that("invert.pmultinom rejects input of the wrong type", {
  expect_error(invert.pmultinom(lower=c("string",0,0), probs=c(1/3, 1/3, 1/3), target.prob=.95, method="exact"), "is.numeric")
  expect_error(invert.pmultinom(lower=c(0,0,0), probs=c("string", 1/3, 1/3), target.prob=.95, method="exact"), "is.numeric")
  expect_error(invert.pmultinom(lower=c(0,0,0), probs=c(1/3, 1/3, 1/3), target.prob="string", method="exact"), "is.numeric")
})

test_that("Errors when arguments don't recycle", {
  expect_error(invert.pmultinom(lower=c(0,0), probs=c(1/3, 1/3, 1/3), target.prob=.95, method="exact"), "longer argument not a multiple of length of shorter")
  expect_error(invert.pmultinom(lower=c(0,0,0), probs=c(1/2,1/2), target.prob=.95, method="exact"), "longer argument not a multiple of length of shorter")
})

## NA VALUES

test_that("NA input gives NA output", {
  expect_identical(invert.pmultinom(lower=c(NA,0,0), probs=c(1/3, 1/3, 1/3), target.prob=.95, method="exact"), NA)
  expect_identical(invert.pmultinom(lower=c(0,0,0), probs=c(1/3, NA, 1/3), target.prob=.95, method="exact"), NA)
  expect_identical(invert.pmultinom(lower=c(0,0,0), probs=c(1/3, 1/3, 1/3), target.prob=NA, method="exact"), NA)
  expect_equal(invert.pmultinom(lower=c(0,0,0), probs=c(1/3, 1/3, 1/3), target.prob=c(.95, NA), method="exact"), c(11, NA))
})

## RANDOMLY GENERATED TESTS
# library(MCMCpack)
# set.seed(320)
# generate.upper.case <- function()
# {
#   k <- rgeom(1, .5)+1
#   bs <- rpois(k, 3)
#   n <- rgeom(1, .2) + 1
#   p <- as.vector(rdirichlet(1, rep.int(1, k)))
#   target.prob <- runif(1)
#   return(list(upper=bs, probs=p, target.prob=target.prob, method="exact"))
# }
# upper.cases <- replicate(100, generate.upper.case(), simplify=FALSE)
# save(upper.cases, file="upper_cases_for_invert_pmultinom.Rdata")
load("upper_cases_for_invert_pmultinom.Rdata")
for (this.case in upper.cases)
{
  crossing <- do.call(invert.pmultinom, this.case)
  expect_gt(with(this.case, pmultinom(upper=upper, probs=probs, size=crossing-1, method="exact")), this.case$target.prob)
  expect_lte(with(this.case, pmultinom(upper=upper, probs=probs, size=crossing, method="exact")), this.case$target.prob)
}
lower.cases <- lapply(upper.cases, function(x) {y <- x; y$upper <- NULL; y$lower <- x$upper; return(y)})
for (this.case in lower.cases)
{
  crossing <- do.call(invert.pmultinom, this.case)
  expect_lt(with(this.case, pmultinom(lower=lower, probs=probs, size=crossing-1, method="exact")), this.case$target.prob)
  expect_gte(with(this.case, pmultinom(lower=lower, probs=probs, size=crossing, method="exact")), this.case$target.prob)
}

