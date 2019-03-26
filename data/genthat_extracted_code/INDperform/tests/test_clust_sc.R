context("test clust_sc")

scores_ex <- scoring(trend_tbl = model_trend_ex, mod_tbl = all_results_ex,
  press_type = INDperform::press_type_ex)
dist_ex <- dist_sc(summary_sc(scores_ex)[[3]], method_dist = "euclidean")
dat <- clust_sc(dist_ex, method_clust = "complete")

test_that("test structure of returned object", {
  expect_s3_class(dat, "hclust")
  expect_equal(dat$dist.method, "euclidean")
  expect_equal(dat$method, "complete")
})

test_that("test error messages and printed message",
  {
    expect_error(clust_sc(method_clust = "complete"),
      "Argument dist_mat is missing")
    expect_error(clust_sc(dist_mat = as.list(dist_ex)),
      "dist_mat is not an object of")
    expect_error(clust_sc(dist_ex, method_clust = "gower"))  # method in dist_sc
    expect_message(clust_sc(dist_ex, method_clust = "complete"))
  })
