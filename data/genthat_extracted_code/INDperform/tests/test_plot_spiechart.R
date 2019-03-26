context("test plot_spiechart")

scr <- scoring(trend_tbl = model_trend_ex, mod_tbl = all_results_ex,
  press_type = press_type_ex)
smry <- summary_sc(scr)

test_that("test error messages", {
  expect_error(plot_spiechart(), "Argument summary_tbl is missing")
  expect_error(plot_spiechart(summary_tbl = as.data.frame(smry[[1]])),
    "summary_tbl has to be a list")
})
