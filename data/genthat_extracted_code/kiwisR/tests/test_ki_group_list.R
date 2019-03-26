context("Testing group metadata retrieval and filtering")

test_that("ki_group_list returns a tibble with three columns", {
  skip_if_net_down()

  group_test <- ki_group_list(hub = "kisters")
  static_names <- c("group_name", "group_id", "group_type")


  expect_is(group_test, "tbl_df")
  expect(sum(static_names %in% names(group_test)) == 3)
})

test_that("ki_group_list throws error if no hub specified", {
  expect_error(ki_group_list())
})
