context("Summary Statistics")

# test_as_row
# -----------
# Reference example
data <- data.frame(time=c(1:25),
                   nA=as.integer(stats::rnorm(25, 25, 5)),
                   nB=as.integer(stats::rnorm(25, 50, 5)),
                   nC=as.integer(stats::rnorm(25, 100, 25)),
                   nD=as.integer(stats::rnorm(25, 200, 25)),
                   exposure=as.integer(stats::rnorm(25, 50, 5)))
data$event <- data$nA
data$rate <- data$nA / data$exposure
a1 <- test_as_row(prr(data))
# Return behavior
test_that("function returns the correct class", {
  expect_is(a1, "data.frame")
  expect_is(a1, "mdsstat_df")
})
test_that("function returns core mdsstat_df components", {
  expect_true(all(names(a1) %in% c("test_name",
                                   "analysis_of",
                                   "run_status",
                                   "run_msg",
                                   "ref_time_start",
                                   "ref_time_end",
                                   "eval_period",
                                   "test_hyp",
                                   "test_params",
                                   "signal",
                                   "signal_threshold",
                                   "stat", "stat_lcl", "stat_ucl",
                                   "p_value",
                                   "stat_addtl")))
  expect_equal(nrow(a1), 1)
})
test_that("outputs are as expected", {
  expect_equal(as.character(a1$test_name), "Proportional Reporting Ratio")
  expect_equal(a1$analysis_of, NA)
  expect_true(a1$run_status)
})
test_that("only legal inputs are allowed", {
  expect_error(test_as_row())
  expect_equal(as.character(a1$test_name), "Proportional Reporting Ratio")
  expect_equal(a1$analysis_of, NA)
  expect_true(a1$run_status)
})

# define_algos
# ------------
# Reference example
x <- list(prr=list(),
          shewhart=list(),
          shewhart=list(ts_event=c(Rate="rate"), we_rule=2L),
          poisson_rare=list(p_rate=0.3))
a2 <- define_algos(x)
# # Return behavior
# test_that("function returns the correct class", {
#   expect_is(a2, "list")
#   expect_is(a2, "mdsstat_da")
# })
# test_that("function returns core mdsstat_da components", {
#   expect_equal(names(a2), c("prr", "shewhart", "shewhart", "poisson_rare"))
#   expect_equal(length(a2), 4)
# })
# test_that("outputs are as expected", {
#   expect_equal(a2[[1]], list())
#   expect_equal(a2[[2]], list())
#   expect_equal(names(a2[[3]]), c("ts_event", "we_rule"))
#   expect_equal(names(a2[[4]]), c("p_rate"))
# })

# run_algos
# ---------
# Reference example
a3 <- run_algos(data, a2)
# Return behavior
test_that("function returns the correct class", {
  expect_is(a3, "data.frame")
  expect_is(a3, "mdsstat_df")
  expect_is(a3, "mdsstat_tests")
})
test_that("function returns core mdsstat_tests components", {
  expect_true(all(names(a3) %in% c("test_name",
                                   "analysis_of",
                                   "run_status",
                                   "run_msg",
                                   "ref_time_start",
                                   "ref_time_end",
                                   "eval_period",
                                   "test_hyp",
                                   "test_params",
                                   "signal",
                                   "signal_threshold",
                                   "stat", "stat_lcl", "stat_ucl",
                                   "p_value",
                                   "stat_addtl")))
  expect_equal(nrow(a3), 4)
})
# Output behavior
test_that("outputs are as expected", {
  expect_equal(as.character(a3$test_name), c(
    "Proportional Reporting Ratio",
    "Shewhart x-bar Western Electric Rule 1",
    "Shewhart x-bar Western Electric Rule 2",
    "Poisson Rare"))
  expect_equal(a1$analysis_of[1], NA)
  expect_equal(a1$analysis_of[2], NA)
  expect_equal(a1$analysis_of[3], NA)
  expect_equal(a1$analysis_of[4], NA)
  expect_equal(a3$run_status, c(T, T, T, F))
})
# Parameter settings
a3a <- run_algos(data, a2, dataframe=F)
test_that("list option works as expected", {
  expect_is(a3a, "list")
  expect_equal(length(a3a), 4)
  expect_equal(a3a[[1]]$test_name, "Proportional Reporting Ratio")
  expect_equal(a3a[[2]]$test_name, "Shewhart x-bar Western Electric Rule 1")
  expect_equal(a3a[[3]]$test_name, "Shewhart x-bar Western Electric Rule 2")
  expect_equal(a3a[[4]]$test_name, "Poisson Rare")
})
test_that("DPA runs as it should when DPA data exists", {
  expect_is(run_algos(data, a2, non_dpa="skip"), "data.frame")
  expect_is(run_algos(data, a2, non_dpa="warn"), "data.frame")
  expect_is(run_algos(data, a2, non_dpa="stop"), "data.frame")
})
x <- list(prr=list(),
          shewhart=list(),
          poisson_rare=list(p_rate=0.3))
a4 <- define_algos(x)
data <- data.frame(time=c(1:25), event=as.integer(stats::rnorm(25, 100, 25)))
test_that("non_dpa option works as expected", {
  expect_is(run_algos(data, a4, non_dpa="skip"), "data.frame")
  expect_warning(run_algos(data, a4, non_dpa="warn"))
  expect_error(run_algos(data, a4, non_dpa="stop"))
})
# Input is a list rather than a single time series
test_that("list data input works as expected", {
  expect_is(run_algos(mds_ts, a4), "data.frame")
  expect_is(run_algos(mds_ts, a4, dataframe=F), "list")
  expect_error(run_algos(list(foo=data.frame(c(1:3))), a4))
  expect_error(run_algos(list(foo=data.frame(c(1:3))), a4, dataframe=F))
})

