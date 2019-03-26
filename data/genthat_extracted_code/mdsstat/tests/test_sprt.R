context("SPRT Algorithm")

# Reference example
data <- data.frame(time=c(1:25), event=as.integer(stats::rnorm(25, 100, 25)))
a1 <- sprt(data, h1=110)

# Basic
# -----

# Return behavior
test_that("function returns the correct class", {
  expect_is(a1, "list")
  expect_is(a1, "mdsstat_test")
})
test_that("function returns core mdsstat_test components", {
  expect_true(all(names(a1) %in% c("test_name",
                                   "analysis_of",
                                   "status",
                                   "result",
                                   "params",
                                   "data")))
})
test_that("outputs are as expected", {
  expect_equal(a1$test_name, "Poisson SPRT")
  expect_equal(a1$analysis_of, NA)
  expect_true(a1$status)
  expect_true(all(names(a1$result) %in% c("statistic",
                                          "lcl",
                                          "ucl",
                                          "p",
                                          "signal",
                                          "signal_threshold",
                                          "h0",
                                          "h1")))
  expect_true(abs(a1$result$statistic) > 0)
  expect_true(a1$result$lcl < 0)
  expect_true(abs(a1$result$ucl) > 0)
  expect_true(is.na(a1$result$p))
  expect_is(a1$result$signal, "logical")
  expect_equal(a1$result$signal_threshold, a1$result$ucl)
  expect_true(all(names(a1$params) %in% c("test_hyp",
                                          "eval_period",
                                          "obs_period",
                                          "h1_source",
                                          "alpha",
                                          "beta")))
  expect_is(a1$params$test_hyp, "character")
  expect_equal(a1$params$eval_period, 25)
  expect_equal(a1$params$obs_period, 1)
  expect_equal(a1$params$h1_source, "h1")
  expect_equal(a1$params$alpha, 0.05)
  expect_equal(a1$params$beta, 0.20)
  expect_true(all(names(a1$data) %in% c("reference_time",
                                          "data")))
  expect_equal(a1$data$reference_time, range(a1$data$data$time))
  expect_equal(a1$data$data, data)
})

# Parameter checks
# ----------------
a2d <- data
a2 <- sprt(a2d, h1=8)
test_that("df parameter functions as expected", {
  expect_is(a2, "list")
  expect_is(a2, "mdsstat_test")
  expect_true(all(names(a2) %in% c("test_name",
                                   "analysis_of",
                                   "status",
                                   "result",
                                   "params",
                                   "data")))
  expect_equal(a2$test_name, "Poisson SPRT")
  expect_equal(a2$analysis_of, NA)
  expect_true(a2$status)
  expect_true(all(names(a2$result) %in% c("statistic",
                                          "lcl",
                                          "ucl",
                                          "p",
                                          "signal",
                                          "signal_threshold",
                                          "h0",
                                          "h1")))
  expect_true(abs(a2$result$statistic) > 0)
  expect_true(a1$result$lcl < 0)
  expect_true(abs(a2$result$ucl) > 0)
  expect_true(is.na(a1$result$p))
  expect_is(a2$result$signal, "logical")
  expect_true(a2$result$signal_threshold > 0)
  expect_true(all(names(a2$params) %in% c("test_hyp",
                                          "eval_period",
                                          "obs_period",
                                          "h1_source",
                                          "alpha",
                                          "beta")))
  expect_is(a2$params$test_hyp, "character")
  expect_equal(a1$params$eval_period, 25)
  expect_equal(a1$params$obs_period, 1)
  expect_equal(a1$params$h1_source, "h1")
  expect_equal(a1$params$alpha, 0.05)
  expect_equal(a1$params$beta, 0.20)
  expect_true(all(names(a2$data) %in% c("reference_time",
                                        "data")))
  expect_equal(a2$data$reference_time, range(a2d$time))
  expect_equal(a2$data$data[[1]], a2d[[1]])
  expect_equal(a2$data$data[[2]], ifelse(is.na(a2d$event), 0, a2d$event))
})

a2d <- data
a2d$rate <- ifelse(is.na(a2d$event), 0, a2d$event)
a2d$exposure <- stats::rnorm(25, 50, 5)
a2d$rate <- a2d$rate / a2d$exposure
a2 <- sprt(a2d, ts_event=c("Rate"="rate"), h1=8)
test_that("ts_event parameter functions as expected", {
  expect_equal(a2$data$reference_time, range(a2d$time))
  expect_equal(a2$data$data[[1]], a2d$time)
  expect_equal(a2$data$data$rate, a2d$rate)
})

a2 <- sprt(a2d, analysis_of="Testing", h1=8)
test_that("ts_event parameter functions as expected", {
  expect_equal(a2$analysis_of, "Testing")
})

test_that("eval_period parameter functions as expected", {
  expect_error(sprt(a2d, eval_period=0, h1=8))
  expect_error(sprt(a2d, eval_period=5.5, h1=8))
  expect_error(sprt(a2d, eval_period=26, h1=8))
  expect_error(sprt(a2d, eval_period=10, obs_period=11, h1=8))
})

test_that("obs_period parameter functions as expected", {
  expect_is(sprt(a2d, obs_period=3, h1=8), "mdsstat_test")
  expect_is(sprt(a2d, obs_period=12, h0=1, h1=8), "mdsstat_test")
  expect_error(sprt(a2d, obs_period=0, h1=8))
  expect_error(sprt(a2d, obs_period=5.5, h1=8))
  expect_error(sprt(a2d, obs_period=26, h1=8))
  expect_error(sprt(a2d, obs_period=25, h1=8))
  expect_error(sprt(a2d, obs_period="now", h1=8))
})

test_that("h0 parameter functions as expected", {
  expect_is(sprt(a2d, h0=0.1, h1=8), "mdsstat_test")
  expect_is(sprt(a2d, h0=25, h1=8), "mdsstat_test")
  expect_error(sprt(a2d, h0=0, h1=8))
  expect_error(sprt(a2d, h0=-1, h1=8))
  expect_error(sprt(a2d, h0="null", h1=8))
})

a2e <- sprt(a2d, h1=8, relative_risk=1.2)
a2f <- sprt(a2d, h1=8)
test_that("h1 parameter functions as expected", {
  expect_is(a2e, "mdsstat_test")
  expect_equal(a2e$params$h1_source, "relative_risk")
  expect_equal(a2f$params$h1_source, "h1")
  expect_true(a2e$result$h1 != 8)
  expect_equal(a2f$result$h1, 8)
  expect_is(sprt(a2d, h0=25, h1=8), "mdsstat_test")
  expect_error(sprt(a2d, h1=0))
  expect_error(sprt(a2d, h1=-1))
  expect_error(sprt(a2d, h1="null"))
})

a2g <- sprt(a2d, relative_risk=1.2)
test_that("relative_risk parameter functions as expected", {
  expect_is(a2g, "mdsstat_test")
  expect_equal(a2g$params$h1_source, "relative_risk")
  expect_true(a2g$result$h1 != 8)
  expect_is(sprt(a2d, relative_risk=2), "mdsstat_test")
  expect_error(sprt(a2d, relative_risk=0))
  expect_error(sprt(a2d, relative_risk=-1))
  expect_error(sprt(a2d, relative_risk=1))
  expect_error(sprt(a2d, relative_risk="null"))
})

a2h <- sprt(a2d, h1=8, distribution="normal")
test_that("relative_risk parameter functions as expected", {
  expect_is(a2h, "mdsstat_test")
  expect_equal(a2h$test_name, "Normal SPRT")
  expect_error(sprt(a2d, h1=8, distribution=3))
  expect_error(sprt(a2d, h1=8, distribution="exponential"))
  expect_error(sprt(a2d, h1=8, distribution="binomial"))
})

a2i <- sprt(a2d, h1=8, alpha=0.01)
test_that("alpha parameter functions as expected", {
  expect_error(sprt(a2d, h1=8, alpha=0))
  expect_error(sprt(a2d, h1=8, alpha=1))
  expect_error(sprt(a2d, h1=8, alpha=-.01))
  expect_error(sprt(a2d, h1=8, alpha=1.01))
  expect_is(a2i, "mdsstat_test")
  expect_equal(a2i$params$alpha, 0.01)
})

a2i <- sprt(a2d, h1=8, beta=0.01)
test_that("alpha parameter functions as expected", {
  expect_error(sprt(a2d, h1=8, beta=0))
  expect_error(sprt(a2d, h1=8, beta=1))
  expect_error(sprt(a2d, h1=8, beta=-.01))
  expect_error(sprt(a2d, h1=8, beta=1.01))
  expect_is(a2i, "mdsstat_test")
  expect_equal(a2i$params$beta, 0.01)
})

a3 <- sprt(a2d, h1=8)
a3a <- sprt(a2d, h1=8, h1_type="greater")
a3b <- sprt(a2d, h1=8, h1_type="less")
a3c <- sprt(a2d, h1=8, h1_type="not equal")
test_that("h1_type parameter functions as expected", {
  expect_equal(a3$params$test_hyp, "LLR >= upper rejection level")
  expect_equal(a3a$params$test_hyp, "LLR >= upper rejection level")
  expect_equal(a3b$params$test_hyp, "LLR <= lower rejection level")
  expect_equal(a3c$params$test_hyp, "LLR exceeds indifference region")
  expect_equal(a3$result$signal_threshold, a3$result$ucl)
  expect_equal(a3a$result$signal_threshold, a3a$result$ucl)
  expect_equal(a3b$result$signal_threshold, a3b$result$lcl)
  expect_equal(a3c$result$signal_threshold, c(a3a$result$lcl, a3a$result$ucl))
  expect_error(sprt(a2d, h1=8, h1_type=2))
  expect_error(sprt(a2d, h1=8, h1_type="not"))
})

