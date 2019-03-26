context("Testing time series value retrieval and filters")

test_that("ki_timeseries_values throws error when no hub specified", {
  expect_error(ki_timeseries_values(hub = "", ts_id = "1234"))
})

test_that("ki_timeseries_values throws error when no ts_id specified", {
  expect_error(ki_timeseries_values(hub = "kisters"))
})

test_that("ki_timeseries_values returns error if ts_id doesn't exist", {
  expect_error(ki_timeseries_values(hub = "kisters", ts_id = "FAKE"))
})

test_that("ki_timeseries_values returns error if no data for specified dates", {
  test_ts <- "231042"
  # Past 24 hours by default
  expect_error(ki_timeseries_values(hub = "kisters", ts_id = test_ts))
  # Specified dates
  expect_error(ki_timeseries_values(hub = "kisters",
                                    ts_id = test_ts,
                                    start_date = Sys.Date(),
                                    end_date = Sys.Date() + 1))
})

test_that("ki_timeseries_values returns table with data", {
  skip_if_net_down()

  test_ts <- "231042"
  ts_vals <- ki_timeseries_values(hub = "kisters",
                                  ts_id = test_ts,
                                  start_date = "2015-12-01",
                                  end_date = "2018-01-01")
  expect_is(ts_vals, "tbl_df")
})

test_that("ki_timeseries_values can take a vector of ts_ids and return list of tables", {
  skip_if_net_down()

  test_ts <- c("231042","244042")
  ts_vals <- ki_timeseries_values(hub = "kisters",
                                  ts_id = test_ts,
                                  start_date = "2015-12-01",
                                  end_date = "2018-01-01")
  expect_is(ts_vals, "list")
  expect_is(ts_vals[[1]], "tbl_df")
  expect_is(ts_vals[[2]], "tbl_df")
})

test_that("ki_timeseries_values returns three columns (two static) by default", {
  skip_if_net_down()

  test_ts <- "231042"
  ts_vals <- ki_timeseries_values(hub = "kisters",
                                  ts_id = test_ts,
                                  start_date = "2015-12-01",
                                  end_date = "2018-01-01")

  expect(sum(c("Timestamp", "Units") %in% names(ts_vals)) == 2)
})
