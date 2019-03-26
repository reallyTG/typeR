context("test plot_clus_sc")

# Test data input validation
test_that("test error messages", {
  expect_error(plot_clust_sc(), "Argument x is missing")
  expect_error(plot_clust_sc(x = 1:10), "x is not an object that contains")
  expect_error(plot_clust_sc(x = rbind(1:10, 1:10)),
    "x is not an object that contains")
  expect_error(plot_clust_sc(x = data.frame(1:10,
    1:10)), "x is not an object that contains")
  expect_error(plot_clust_sc(x = list(1:10)), "x is not an object that contains")
})
