context("test select_interaction")

mod_tbl <- merge_models_ex[1:5, ]
dat <- select_interaction(mod_tbl)

no_press <- length(unique(mod_tbl$press))

test_that("test output", {
  expect_s3_class(dat, "tbl_df")
  expect_equal(ncol(dat), 3)
  expect_equal(nrow(dat), (nrow(mod_tbl) * (no_press -
    1)))
  expect_true(all(unique(dat$ind) %in% mod_tbl$ind))
  expect_true(all(unique(dat$press) %in% mod_tbl$press))
  expect_true(all(unique(dat$t_var) %in% mod_tbl$press))
})

a1 <- mod_tbl[, -1]
a2 <- mod_tbl[, -2]
a3 <- mod_tbl[, -3]

test_that("test error messages of data input validation",
  {
    expect_error(select_interaction(), "Argument mod_tbl is missing")
    expect_error(select_interaction(mod_tbl = merge_models_ex[1,
      ]), "mod_tbl contains only 1 pressure")
    expect_error(select_interaction(a1), "The following variables")
    expect_error(select_interaction(a2), "The following variables")
    expect_error(select_interaction(a3), "The following variables")
  })
