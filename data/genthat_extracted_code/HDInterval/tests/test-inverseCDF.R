
# test_that code for inverseCDF


context("inverseCDF")

test_that("inverseCDF gives correct output",  {
  ci95 <- inverseCDF(c(0.025, 0.975), pgamma, shape=2.5, rate=2)
  expect_equivalent(ci95, c(0.2078078, 3.2081480))
  hdi95 <- hdi(inverseCDF, CDF=pgamma, shape=2.5, rate=2)
  expect_equivalent(hdi95, c(0.07398089, 2.79779970))
  # custom function
  pmixg <- function(q)
    0.6 * pnorm(q, 0, 1) + 0.4 * pnorm(q, 4, 2^0.5)
  ci95 <- inverseCDF(c(0.025, 0.975), pmixg)
  expect_equivalent(round(ci95, 5), c(-1.73185,  6.16957))
  hdi95 <- hdi(inverseCDF, CDF=pmixg)
  expect_equivalent(round(hdi95, 5), c(-1.87076, 5.99713))
}  )

