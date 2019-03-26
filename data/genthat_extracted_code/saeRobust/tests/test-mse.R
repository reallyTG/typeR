context("mse")
test_that("mse.rfh", {

  expectIs <- function(x, a) {
    testthat::expect_is(x, a)
  }

  expectEqual <- function(x, y) {
    testthat::expect_equal(x, y)
  }

  library("saeSim")
  set.seed(2)
  dat <- base_id(10, 1) %>%
    sim_gen_e(sd = 1) %>%
    sim_gen_x() %>%
    sim_gen_v(sd = 1) %>%
    sim_resp_eq(y = 100 + 2 * x + v + e) %>%
    as.data.frame

  dat$samplingVar <- 1

  modelFit <- rfh(y ~ x, dat, "samplingVar")

  out <- mse(modelFit, "pseudo", "reblup")
  expectEqual(names(out), c("direct", "reblup", "samplingVar", "pseudo"))

  out <- mse(modelFit, c("boot", "pseudo"), "reblup", B = 3)
  expectEqual(names(out), c("direct", "reblup", "samplingVar", "pseudo", "boot"))

  out <- mse(modelFit, c("boot", "pseudo"), predType = "reblupbc", B = 3)
  expectEqual(names(out), c("direct", "reblupbc", "samplingVar", "pseudobc", "bootbc"))

})


