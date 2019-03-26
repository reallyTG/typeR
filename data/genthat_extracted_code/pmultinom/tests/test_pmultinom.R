library(testthat)
context("test_pmultinom")

## LARGE CASES
test_that("When the number of clones is large, the result remains numerically stable",
          expect_equal(pmultinom(upper=c(1,rep.int(0,10^4-1)), size=1, probs=rep.int(10^-4,10^4), method="exact"), dbinom(1, 1, 10^-4))
)
test_that("When the size is large, the result remains numerically stable",
          # In the following case, the result is equal to 0 according to
          # all.equal, as it should be. However, the logarithm of the result is
          # completely wrong. It shows that logarithms of small pmultinom
          # results, calculated with this algorithm, should not be taken.
          expect_equal(pmultinom(upper=c(10,0), size=10^2, probs=c(.5, .5), method="exact"), dbinom(10, 10^2, .5))
)

## EDGE CASES
test_that("When the probability of a category is 0, it doesn't meet lower bounds", {
  expect_equal(pmultinom(lower=c(0,0), size=5, probs=c(1,0), method="exact"), 0)
  expect_equal(pmultinom(lower=c(0,-1), size=5, probs=c(1,0), method="exact"), 1)
})

test_that("pmultinom gives 0 as output for impossible-to-satisfy input", {
  expect_equal(pmultinom(c(2, -1), c(Inf, Inf), 5, c(.5, .5), method="exact"), pmultinom:::reference.complementary.cdf(lower=c(2, -1), size=5, probs=c(.5, .5), method="exact"))
  expect_equal(pmultinom(c(2, -1), c(2,Inf), 5, c(.5, .5), method="exact"), 0)
  expect_equal(pmultinom(c(2, -1), c(1,Inf), 5, c(.5, .5), method="exact"), 0)
})

test_that("Results make sense when all upper bounds are 0", {
  expect_equal(pmultinom(upper=c(0,0), size=0, probs=c(.5, .5), method="exact"), 1)
  expect_equal(pmultinom(upper=c(0,0), size=1, probs=c(.5, .5), method="exact"), 0)
})

test_that("Probabilities of being within the possible range are 1", {
  expect_equal(pmultinom(upper=c(10,10), size=10, probs=c(.5,.5), method="exact"), 1)
  expect_equal(pmultinom(lower=c(-1,-1), size=10, probs=c(.5,.5), method="exact"), 1)
  expect_equal(pmultinom(lower=c(-Inf,-Inf), upper=c(Inf, Inf), size=10, probs=c(.5,.5), method="exact"), 1)
  expect_equal(pmultinom(size=10, probs=c(.5,.5), method="exact"), 1)
})

test_that("Sensible results with only one category", {
  expect_equal(pmultinom(upper=5, size=10, probs=1, method="exact"), 0)
  expect_equal(pmultinom(upper=5, size=5, probs=1, method="exact"), 1)
  expect_equal(pmultinom(lower=5, size=10, probs=1, method="exact"), 1)
  expect_equal(pmultinom(lower=10, size=10, probs=1, method="exact"), 0)
})

test_that("Probability is 0 when a condition is impossible to meet", {
  expect_gt(pmultinom(c(2, -1), c(3,5), 5, c(.5, .5), method="exact"), 0)
  expect_equal(pmultinom(c(2, -1), c(2,5), 5, c(.5, .5), method="exact"), 0)
  expect_equal(pmultinom(c(2, -1), c(1,5), 5, c(.5, .5), method="exact"), 0)
})

## RANDOMLY GENERATED CASES
# library(MCMCpack)
# set.seed(314)
# generate.cdf.case <- function()
# {
#   k <- rgeom(1, .5)+1
#   bs <- rpois(k, 3)
#   n <- rgeom(1, .2) + 1
#   p <- as.vector(rdirichlet(1, rep.int(1, k)))
#   return(list(upper=bs, size=n, probs=p, method="exact"))
# }
# cdf.cases <- replicate(10^3, generate.cdf.case(), simplify=FALSE)
# save(cdf.cases, file="cdf_cases.Rdata")
load("cdf_cases.Rdata")
test_that("pmultinom correctly calculates the complementary cdf in random cases", {
  for (case in cdf.cases)
  {
    expect_equal(do.call(pmultinom, case), do.call(reference.cdf, case))
  }
})

# Test with given "lower"
# The main difference for testing the inverse cdf is that we need
# size>=sum(lower), or the probability will be zero. Also, I take the first
# hundred because a few of these tests are very slow, so the total number we can
# do is limited.
complementary.cdf.cases <- lapply(cdf.cases, function(case)
  list(probs=case$probs, method=case$method, lower=case$upper, size=case$size+sum(case$upper)))[1:100]
test_that("pmultinom correctly calculates the complementary cdf in random cases", {
  for (case in complementary.cdf.cases)
  {
    expect_equal(do.call(pmultinom, case), do.call(reference.complementary.cdf, case))
  }
})

## TESTS FOR CORRECT ERROR MESSAGES
test_that("pmultinom rejects input of the wrong type", {
  expect_error(pmultinom(upper="string", size=1, probs=1, method="exact"), "is.numeric")
  expect_error(pmultinom(lower="string", size=1, probs=1, method="exact"), "is.numeric")
  expect_error(pmultinom(upper=1, size="string", probs=1, method="exact"), "is.numeric")
  expect_error(pmultinom(upper=1, size=1, probs="string", method="exact"), "is.numeric")
  expect_error(pmultinom(upper=1, size=1.5, probs=1, method="exact"), "size")
  expect_error(pmultinom(upper=1, size=1, probs=2, method="exact"), "[Pp]rob")
  expect_error(pmultinom(upper=1, size=1, probs=2, method="exact"), "probs")
  expect_error(pmultinom(upper=1, size=1, probs=-1, method="exact"), "probs")
})

# How does it behave when you give weird sizes?
test_that("Arguments are recycled, and there's an error message when they can't", {
  # What if the arguments don't cycle properly?
  # A reasonable question:
  expect_equal(pmultinom(lower=c(1,2,3), size=20, probs=c(.1,.2,.7), method="exact"), pmultinom:::reference.complementary.cdf(lower=c(1,2,3), size=20, probs=c(.1,.2,.7)))

  # Two unreasonable ones:
  # I had to comment these out because, while they work outside of test_that,
  # they don't work within it
  expect_error(pmultinom(lower=c(1,2,3), size=20, probs=c(.1,.9), method="exact"), "longer argument not a multiple of length of shorter")
  expect_error(pmultinom(lower=c(1,2), size=20, probs=c(.1,.2,.7), method="exact"), "longer argument not a multiple of length of shorter")

  # Now testing that you can cycle the arguments if you want to
  expect_equal(pmultinom(lower=c(1,0), size=1000, probs=c(2^-(1:9), 2^-9), method="exact"),
               pmultinom(lower=c(1,0,1,0,1,0,1,0,1,0), size=1000, probs=c(2^-(1:9), 2^-9), method="exact"))
  expect_equal(pmultinom(lower=rep.int(1, 10), size=100, probs=.1, method="exact"),
               pmultinom(lower=rep.int(1, 10), size=100, probs=rep.int(.1, 10), method="exact"))
})

## TEST THAT NA INPUTS GIVE NA OUTPUT
test_that("pmultinom gives NA output with NA input", {
  expect_identical(pmultinom(upper=NA, size=1, probs=1, method="exact"), NA)
  expect_identical(pmultinom(lower=NA, size=1, probs=1, method="exact"), NA)
  expect_identical(pmultinom(upper=1, size=NA, probs=1, method="exact"), NA)
  expect_identical(pmultinom(upper=1, size=1, probs=NA, method="exact"), NA)
  expect_identical(round(pmultinom(upper=1, size=c(1,2,3,NA), probs=1, method="exact")), c(1, 0, 0, NA))
})
