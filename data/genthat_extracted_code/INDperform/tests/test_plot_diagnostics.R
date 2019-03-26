context("test plot_diagnostics")

model_list <- c(all_results_ex$thresh_models[[48]],
  model_gam_ex$model[39], all_results_ex$model[76])
plots <- plot_diagnostics(model_list)
plots2 <- plot_diagnostics(model_gam_ex$model[39])
model_dfr <- all_results_ex


test_that("test error messages", {
  expect_error(plot_diagnostics(), "Argument model_list is missing")
  expect_error(plot_diagnostics(model_list = model_dfr))
})

test_that("structure of returned object", {
  expect_equal(ncol(plots), 9)
  expect_equal(nrow(plots), 3)

  expect_is(plots$ind, "character")
  expect_is(plots$press, "character")
  expect_is(plots$cooks_dist, "list")
  expect_is(plots$acf_plot, "list")
  expect_is(plots$pacf_plot, "list")
  expect_is(plots$resid_plot, "list")
  expect_is(plots$gcvv_plot, "list")
  expect_is(plots$qq_plot, "list")
  expect_is(plots$all_plots, "list")

  expect_is(plots$cooks_dist[[1]], "ggplot")
  # if no threshold-GAM included
  expect_true(is.na(plots2$gcvv_plot[[1]]))
})

# Check if NAs are correctly placed
x <- 1:13
y <- c(NA, 0, NA, 0, 0, NA, 0, 0, NA, 0, 0, 0, 0)
# if all values are zero model results will be NaN
# or -Inf
dat_init <- ind_init(y, x, time = 1:13)
test_mod <- model_gam(init_tbl = dat_init)
test_plot <- plot_diagnostics(test_mod$model)

test_that("NAs in returned object", {
  expect_true(is.na(test_plot$cooks_dist[[1]]))
  expect_true(is.na(test_plot$acf_plot[[1]]))
  expect_true(is.na(test_plot$pacf_plot[[1]]))
  expect_true(is.na(test_plot$gcvv_plot[[1]]))
  expect_true(is.na(test_plot$all_plots[[1]]))
})
