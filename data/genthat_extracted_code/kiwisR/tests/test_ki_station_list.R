context("Testing station metadata retrieval and checks")

test_that("ki_station_list throws error when no hub specified", {
  expect_error(ki_station_list(hub = ""))
})

test_that("ki_station_list should return a tibble", {
  skip_if_net_down()

  stns <- ki_station_list(hub = "kisters")
  expect_is(stns, "tbl_df")
})

test_that("ki_station_list accepts search_term filters", {
  skip_if_net_down()

  stn_filt <- ki_station_list(hub = "kisters", search_term = "A*")
  stn_empty <- ki_station_list(hub = "kisters", search_term = "")

  expect_is(stn_filt, "tbl_df")
  expect_is(stn_empty, "tbl_df")
  expect(nrow(stn_empty) == 0)
})

test_that("ki_station_list accepts bbox filter (vector or character)", {
  skip_if_net_down()

  stn_bbox_str <- "-131.7,-5.4,135.8,75.8"
  stn_bbox_v <- c("-131.7","-5.4","135.8","75.8")
  stn_bbox_filt <- ki_station_list(hub = "kisters", bounding_box = stn_bbox_str)
  stn_bbox_filt2 <- ki_station_list(hub = "kisters", bounding_box = stn_bbox_v)

  expect_is(stn_bbox_filt, "tbl_df")
  expect_is(stn_bbox_filt2, "tbl_df")
  expect_equal(stn_bbox_filt, stn_bbox_filt2)
})

test_that("ki_station_list accepts group_id filter", {
  skip_if_net_down()

  test_group_id <- "21219"
  stns_group <- ki_station_list(hub = "kisters", group_id = test_group_id)
  expect_is(stns_group, "tbl_df")
})

test_that("ki_station_list accepts custom return fields (vector or string)", {
  skip_if_net_down()

  cust_ret_str <- "station_name,station_id,station_no"
  cust_ret_v <- c("station_name", "station_id", "station_no")

  fake_ret_str <- "metadatathatdoesntactuallexist"

  stn_cust_retr <- ki_station_list(hub = "kisters", return_fields = cust_ret_str)
  stn_cust_retr2 <- ki_station_list(hub = "kisters", return_fields = cust_ret_v)

  expect_is(stn_cust_retr, "tbl_df")
  expect_is(stn_cust_retr2, "tbl_df")
  expect_equal(stn_cust_retr, stn_cust_retr2)

  expect_error(ki_station_list(hub = "kisters", return_fields = fake_ret_str))
})
