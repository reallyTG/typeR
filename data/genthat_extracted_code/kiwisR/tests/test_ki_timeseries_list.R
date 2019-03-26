context("Testing time series metadata retrieval and checks")

test_that("ki_timeseries_list throws error when no hub specified", {
  expect_error(ki_timeseries_list(hub = "", station_id = "12345"))
})

test_that("ki_timeseries_list throws error when no station_id, group_id or ts_name provided", {
  expect_error(ki_timeseries_list(hub = "kisters"))
  expect_error(ki_timeseries_list(hub = "kisters", station_id = ""))
  expect_error(ki_timeseries_list(hub = "kisters", ts_name = ""))
  expect_error(ki_timeseries_list(hub = "kisters", group_id = ""))
})

test_that("ki_timeseries_list accepts station_id for retrieving metadata", {
  skip_if_net_down()

  stn_id_test <- "23438"
  ts_meta <- ki_timeseries_list(hub = "kisters", station_id = stn_id_test)

  expect_is(ts_meta, "tbl_df")
})

test_that("ki_timeseries_list accepts ts_name for retrieving metadata", {
  skip_if_net_down()

  ts_meta <- ki_timeseries_list(hub = "kisters", ts_name = "A*")

  expect_is(ts_meta, "tbl_df")
})

test_that("ki_timeseries_list accepts group_id for retrieving metadata", {
  skip_if_net_down()

  ts_group_test <- "11919"
  ts_meta <- ki_timeseries_list(hub = "kisters", group_id = ts_group_test)

  expect_is(ts_meta, "tbl_df")
})

test_that("ki_timeseries_list returns coverage columns by default", {
  skip_if_net_down()

  ts_meta <- ki_timeseries_list(hub = "kisters", ts_name = "A*")
  expect(sum(c("from", "to") %in% names(ts_meta)) == 2)
})

test_that("ki_timeseries_list allows for turning coverage off increase query speed", {
  skip_if_net_down()

  ts_meta <- ki_timeseries_list(hub = "kisters", ts_name = "A*", coverage = FALSE)
  expect(sum(c("from", "to") %in% names(ts_meta)) == 0)
})

test_that("ki_timeseries_list allows for custom return fields (vector or string)", {
  skip_if_net_down()

  cust_ret_str <- "station_name,ts_name,ts_id"
  cust_ret_v <- c("station_name", "ts_name", "ts_id")

  fake_ret_str <- "metadatathatdoesntactuallexist"

  stn_cust_retr <- ki_timeseries_list(hub = "kisters", ts_name = "A*", return_fields = cust_ret_str)
  stn_cust_retr2 <- ki_timeseries_list(hub = "kisters", ts_name = "A*", return_fields = cust_ret_v)

  expect_is(stn_cust_retr, "tbl_df")
  expect_is(stn_cust_retr2, "tbl_df")
  expect_equal(stn_cust_retr, stn_cust_retr2)

  expect_error(ki_timeseries_list(hub = "kisters", ts_name = "A*", return_fields = fake_ret_str))
})
