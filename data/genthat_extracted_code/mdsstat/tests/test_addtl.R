context("Additional Algorithms")

# Reference example
data <- data.frame(time=c(1:8), event=c(rep(0, 6), stats::rpois(2, 4)))
a1 <- poisson_rare(data)

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
  expect_equal(a1$test_name, "Poisson Rare")
  expect_equal(a1$analysis_of, NA)
  expect_true(a1$status)
  expect_true(all(names(a1$result) %in% c("statistic",
                                          "lcl",
                                          "ucl",
                                          "p",
                                          "signal",
                                          "signal_threshold")))
  expect_true(a1$result$statistic > 0)
  expect_true(a1$result$lcl > 0)
  expect_true(a1$result$ucl > 0)
  expect_true(a1$result$p > 0)
  expect_is(a1$result$signal, "logical")
  expect_true(a1$result$signal_threshold > 0)
  expect_true(all(names(a1$params) %in% c("test_hyp",
                                          "eval_period",
                                          "zero_rate",
                                          "p_rate",
                                          "p_crit",
                                          "h_alternative")))
  expect_is(a1$params$test_hyp, "character")
  expect_equal(a1$params$zero_rate, 2/3)
  expect_equal(a1$params$p_rate, 0.2)
  expect_equal(a1$params$p_crit, 0.05)
  expect_equal(a1$params$h_alternative, "greater")
  expect_true(all(names(a1$data) %in% c("reference_time",
                                          "data")))
  expect_equal(a1$data$reference_time, range(a1$data$data$time))
  expect_equal(a1$data$data, data)
})


# Parameter checks
# ----------------

a2 <- poisson_rare(data)
test_that("df parameter functions as expected", {
  expect_is(a2, "list")
  expect_is(a2, "mdsstat_test")
  expect_true(all(names(a2) %in% c("test_name",
                                   "analysis_of",
                                   "status",
                                   "result",
                                   "params",
                                   "data")))
  expect_equal(a2$test_name, "Poisson Rare")
  expect_equal(a2$analysis_of, NA)
  expect_true(a2$status)
  expect_true(all(names(a2$result) %in% c("statistic",
                                          "lcl",
                                          "ucl",
                                          "p",
                                          "signal",
                                          "signal_threshold")))
  expect_true(a2$result$statistic > 0)
  expect_true(a2$result$lcl > 0)
  expect_true(a2$result$ucl > 0)
  expect_true(a2$result$p > 0)
  expect_is(a2$result$signal, "logical")
  expect_true(a2$result$signal_threshold > 0)
  expect_true(all(names(a2$params) %in% c("test_hyp",
                                          "eval_period",
                                          "zero_rate",
                                          "p_rate",
                                          "p_crit",
                                          "h_alternative")))
  expect_is(a2$params$test_hyp, "character")
  expect_equal(a2$params$zero_rate, 2/3)
  expect_equal(a2$params$p_rate, 0.2)
  expect_equal(a2$params$p_crit, 0.05)
  expect_equal(a2$params$h_alternative, "greater")
  expect_true(all(names(a2$data) %in% c("reference_time",
                                        "data")))
  expect_equal(a2$data$reference_time, range(data$time))
  expect_equal(a2$data$data[[1]], data[[1]])
  expect_equal(a2$data$data[[2]], ifelse(is.na(data$event), 0, data$event))
})

a2d <- data
a2d$exposure <- stats::rnorm(8, 50, 5)
a2d$rate <- ifelse(is.na(a2d$event), 0, a2d$event)
a2d$rate <- a2d$rate / a2d$exposure
a2 <- poisson_rare(a2d, ts_event=c("Rate"="rate"))
test_that("ts_event parameter functions as expected", {
  expect_equal(a2$data$reference_time, range(a2d$time))
  expect_equal(a2$data$data$time, a2d$time)
  expect_equal(a2$data$data$rate, a2d$rate)
})

a2 <- poisson_rare(data, analysis_of="Testing")
test_that("ts_event parameter functions as expected", {
  expect_equal(a2$analysis_of, "Testing")
})

a2 <- poisson_rare(data, eval_period=3)
test_that("eval_period parameter functions as expected", {
  expect_equal(names(a2$status), ">3 time periods required")
  expect_equal(nrow(a2$data$data), 3)
  expect_equal(names(poisson_rare(data, eval_period=2)$status),
               ">3 time periods required")
  expect_error(poisson_rare(data, eval_period=0))
  expect_error(poisson_rare(data, eval_period=nrow(data) + 1))
})

test_that("zero_rate parameter functions as expected", {
  expect_is(poisson_rare(data, zero_rate=0), "mdsstat_test")
  expect_is(poisson_rare(data, zero_rate=1), "mdsstat_test")
  expect_error(poisson_rare(data, zero_rate=1.1))
  expect_error(poisson_rare(data, zero_rate=-1))
})

test_that("p_rate parameter functions as expected", {
  expect_is(poisson_rare(data, p_rate=0), "mdsstat_test")
  expect_is(poisson_rare(data, p_rate=2500), "mdsstat_test")
  expect_error(poisson_rare(data, p_rate=-1))
  expect_error(poisson_rare(data, p_rate=-.1))
})

test_that("p_crit parameter functions as expected", {
  expect_is(poisson_rare(data, p_crit=0), "mdsstat_test")
  expect_is(poisson_rare(data, p_crit=1), "mdsstat_test")
  expect_error(poisson_rare(data, p_crit=1.1))
  expect_error(poisson_rare(data, p_crit=-.1))
})

