context("bootstrap")
test_that("bootsrtap backbone", {

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

  expectIs(bootstrap(modelFit), "fitrfh")
  expectIs(bootstrap(modelFit, B = 2, filter = "variance"), "list")

  library("saeSim")
  set.seed(2)
  dat <- base_id_temporal(10, 1, 10) %>%
    sim_gen_e(sd = 4) %>%
    sim_gen_x() %>%
    sim_gen_v(sd = 4) %>%
    sim_resp_eq(y = 100 + 2 * x + v + e) %>%
    as.data.frame

  dat$samplingVar <- 16

  modelFit <- rfh(y ~ x, dat, "samplingVar", maxIterParam = 100, correlation = corAR1(10))

  expectIs(bootstrap(modelFit), "fitrfh")
  expectIs(bootstrap(modelFit, B = 2, filter = "variance"), "list")

})
