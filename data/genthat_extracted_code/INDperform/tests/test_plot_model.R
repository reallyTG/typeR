context("test plot_model")

mod_tbl <- all_results_ex[13:14, ]  # 9:10,
init_tbl <- ind_init_ex[13:14, ]
dat <- plot_model(init_tbl, mod_tbl)
dat2 <- plot_model(init_tbl, mod_tbl = merge_models_ex[13:14,
  ])

test_that("structure of returned object", {
  expect_is(dat$id, "integer")
  expect_is(dat$ind, "character")
  expect_is(dat$response_plot, "list")
  expect_is(dat$predict_plot, "list")
  expect_is(dat$deriv_plot, "list")
  expect_is(dat$thresh_plot, "list")
  expect_is(dat$all_plots, "list")
  expect_is(dat$response_plot[[1]], "ggplot")
  expect_true(is.na(dat$deriv_plot[[2]]))
  expect_true(is.na(dat$thresh_plot[[2]]))
  # if not all variables included
  expect_is(dat2$deriv_plot, "logical")
  expect_is(dat2$thresh_plot, "logical")
  expect_true((all(is.na(dat2$deriv_plot))))
  expect_true((all(is.na(dat2$thresh_plot))))
})

mod_tbl2 <- mod_tbl
mod_tbl2$edf <- as.character(mod_tbl2$edf)
init_tbl2 <- ind_init_ex[14:15, ]

test_that("test error messages", {
  expect_error(plot_model(init_tbl), "Argument mod_tbl is missing")
  expect_error(plot_model(mod_tbl = mod_tbl), "Argument init_tbl is missing")
  expect_error(plot_model(init_tbl, mod_tbl, choose_thresh_gam = 2),
    "value for choose_thresh_gam exceeds")
  expect_error(plot_model(init_tbl[, -(1:3)], mod_tbl),
    "The following variables required")
  expect_error(plot_model(init_tbl, mod_tbl[, -(1:3)]),
    "The following variables required")
  expect_error(plot_model(init_tbl, mod_tbl2))  # wrong data type in required variable
  expect_error(plot_model(init_tbl2, mod_tbl), "Not all ids in mod_tbl are provided in init_tbl.")
})
