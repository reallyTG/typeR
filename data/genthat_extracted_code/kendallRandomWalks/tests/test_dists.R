context("Check function related to stable Kendall distribution")

pKend <- pkend(function(x) 1)
qKend <- qkend(function(x) 1)
pKendSym <- pkendSym(function(x) 1)
qKendSym <- qkendSym(function(x) 1)
rKend <- rkend(function(x) 1)
simulated <- rKend(10, 0.5)
dKend <- dkend(function(x) 1)
dens <- dKend(runif(10, 0, 10), 0.56)

testthat::test_that("Support is on positive numbers", {
  testthat::expect_equal(pKend(c(-20, -10, 0), 0.5), rep(0, 3))
})

testthat::test_that("Quantiles are computed correctly", {
  testthat::expect_equal(pKend(qKend(c(0.1, 0.5, 0.9), 0.5), 0.5), c(0.1, 0.5, 0.9),
                         tolerance = 1e-4)
})

testthat::test_that("Symmetric distribution is in fact symmetric", {
  testthat::expect_equal(pKendSym(-2, 0.5), 1 - pKendSym(2, 0.5),
                         tolerance = 1e-4)
})


testthat::test_that("Quantiles of symmetric distribution are computed correctly", {
  testthat::expect_equal(pKendSym(qKendSym(c(0.1, 0.5, 0.9), 0.5), 0.5),
                         c(0.1, 0.5, 0.9),
                         tolerance = 1e-4)

})

testthat::test_that("Numbers are simulated", {
  testthat::expect_equal(length(simulated), 10)
  testthat::expect_equal(sum(is.na(simulated)), 0)
})

testthat::test_that("Density is okay", {
  testthat::expect_equal(sum(is.na(dens)), 0)
  testthat::expect_equal(dKend(0, 0.76), 0)
  testthat::expect_equal(dKend(1, 0.8), 0.8/exp(1))
})

testthat::test_that("Non-finite values are treated correctly", {
  testthat::expect_true(all(is.na(c(pKend(NA, 0.5), qKend(NA, 0.5), pKendSym(NA, 0.5),
                                  qKendSym(NA, 0.5), dKend(NA, 0.5)))))
})
