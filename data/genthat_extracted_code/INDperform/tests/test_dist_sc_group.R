context("test dist_sc_group")

scores_ex <- scoring(trend_tbl = model_trend_ex, mod_tbl = all_results_ex,
  press_type = INDperform::press_type_ex)
sc_sum <- summary_sc(scores_ex)[[3]]

x1 <- list(sc_sum[, 1:2], sc_sum[, 3:4], sc_sum[, 5:6], sc_sum[, 7:8])
x2 <- sc_sum[, 1:2]
x3 <- sc_sum[, 1]
x4 <- list(sc_sum[, 1], sc_sum[, 3], sc_sum[, 5], sc_sum[, 7])

dat1 <- dist_sc_group(x1)
dat2 <- dist_sc_group(x2)
dat4 <- dist_sc_group(x4)

test_that("test structure of returned object", {
  expect_s3_class(dat1, "dist")
  expect_s3_class(dat2, "dist")
  expect_s3_class(dat4, "dist")
  expect_true(is.numeric(dat1))
  expect_true(is.numeric(dat2))
  expect_true(is.numeric(dat4))
})


test_that("error messages and warnings", {
  expect_error(dist_sc_group(x3), "x is neither a list nor a data frame or matrix!")
  expect_message(dist_sc_group(x2), "The distance matrix is based on one group only!")
  # if too many zeros warning with bray-curtis
  expect_warning(dist_sc_group(x1, method_dist = "bray"))
})
