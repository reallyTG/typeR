context("test plot_statespace_ed")

# Test data input validation
ind_sel <- ind_ex[, c(2, 3, 4, 8, 10, 11)]
ed <- statespace_ed(x = ind_sel, time = ind_ex$Year,
  ref_time = ind_ex$Year[1])

test_that("test error messages", {
  expect_error(plot_statespace_ed(), "Argument x is missing")
  expect_error(plot_statespace_ed(x = as.data.frame(ed)),
    "The input object x has to")
  expect_error(plot_statespace_ed(x = as.list(ed)),
    "The input object x has to")
  expect_error(plot_statespace_ed(x = 1:10), "x has to be a tibble")
  expect_error(plot_statespace_ed(x = as.list(1:10)),
    "x has to be a tibble")
})
