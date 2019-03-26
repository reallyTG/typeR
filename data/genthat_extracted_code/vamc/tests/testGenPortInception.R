context("randomly simulated portfolio of variable annuities")
library(vamc)

test_that("congruence test for default portfolio setting", {
  expect_port_equal <- function(seed) {
    set.seed(1)
    tmp <- tempfile()
    eval(bquote(expect_equal_to_reference(genPortInception(), tmp)))
  }

  expect_port_equal(1)
})

test_that("Test for user errors", {
  expect_error(genPortInception(matRng = c(-1, 1)),
               "Please input a positive and increasing maturity range")
  expect_error(genPortInception(matRng = c(2, 1)),
               "Please input a positive and increasing maturity range")
  expect_error(genPortInception(acctValueRng = c(-100, 100)),
               "Please input a positive and increasing account value range")
  expect_error(genPortInception(acctValueRng = c(2000, 1000)),
               "Please input a positive and increasing account value range")
  expect_error(genPortInception(femPct = -0.5),
               "Please input a female percentage between 0 and 1")
  expect_error(genPortInception(femPct = 5),
               "Please input a female percentage between 0 and 1")
  expect_error(genPortInception(prodPct = c(-0.5, 1.5)),
               "Please input a vector of valid product percentages sum up to 1")
  expect_error(genPortInception(prodPct = c(5, 0.1)),
               "Please input a vector of valid product percentages sum up to 1")
  expect_error(genPortInception(prodPct = c(0.9, 0.1), rollUpRate = c(0, 0, 0),
                                riderFee = c(0, 0), withdrawalRate(0, 0)),
               gsub("[\r\n]", "", "Please input prodType, rollUpRate, riderFee,
 and withdrawalRate in the same length"))
  expect_error(genPortInception(numPolicy = 0),
               "Please input numPolicy > 0")
})
