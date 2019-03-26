testthat::context("hct")
Sys.setenv("R_TESTS" = "")
library(HCT)
als=data.frame(
  estimate=c(-1.13, -1.01, -0.96, -1, -1.04, -1, -0.83, -1.04, -0.99, -1.05,
                          -1.14, -1.08, -0.92, -1.16, -0.93, -0.99),
               SE=c(0.05, 0.04, 0.16, 0.12, 0.05, 0.11, 0.02, 0.03, 0.03, 0.06,
                    0.06, 0.03, 0.05, 0.04, 0.06, 0.05),
               N=c(350, 730, 83, 83, 287, 90, 1193, 859, 583, 227, 279, 510, 185,
                   468, 127, 206))
ts=hct(als,'estimate','SE','N',rseed=322)
testthat::test_that(
  "stanfit",
testthat::expect_equal(summary(ts$fit)$summary[19, 6],-1.0163,
tolerance=0.01))
testthat::test_that('criteria',
testthat::expect_equal(ts$criteria(0.025,.3),-.3994,tolerance=0.01))
testthat::test_that('power',
testthat::expect_equal(ts$power(ts$criteria(0.025,0.15),0.5,0.15),0.798,tolerance=0.01))
