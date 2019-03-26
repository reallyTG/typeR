context("test-silicate")


test_that("PATH works", {
  expect_s3_class(gibble(point), "tbl_df") %>% expect_named(c("nrow", "ncol", "type", "object"))
  expect_s3_class(gibble(mpoint), "tbl_df") %>% expect_named(c("nrow", "ncol", "type", "object"))
})
