context("test dist_sc")

scores_ex <- scoring(trend_tbl = model_trend_ex, mod_tbl = all_results_ex,
  press_type = INDperform::press_type_ex)
sc_sum <- summary_sc(scores_ex)
dat <- dist_sc(sc_sum[[3]], method_dist = "euclidean")


test_that("test structure of returned object", {
  expect_s3_class(dat, "dist")
  expect_true(is.numeric(dat))
})

test_that("error messages and warnings", {
  expect_error(dist_sc(sc_sum[3]), "scores_mat is not a data frame or matrix.")
  expect_error(dist_sc(1:10), "scores_mat is not a data frame or matrix.")
  expect_error(dist_sc(sc_sum[[2]]), "All columns in scores_mat have to be numeric.")
  expect_error(dist_sc(scores_tbl = sc_sum[[3]]), "Argument scores_tbl is deprecated;")
  # if too many zeros warning with bray-curtis
  expect_warning(dist_sc(sc_sum[[3]], method_dist = "bray"))
})
