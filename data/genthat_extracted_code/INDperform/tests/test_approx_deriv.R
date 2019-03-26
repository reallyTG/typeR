context("test approx_deriv")

a <- ind_init_ex[25:84, ]
b <- merge_models_ex[25:84, ]
ci_prop_se <- 25
dat <- approx_deriv(a, b, ci_prop_se)

test_that("output tibble", {
  expect_s3_class(dat, "tbl_df")
  # test columns
  expect_equal(ncol(dat), 21)
  expect_true(all(names(b) %in% names(dat)))
  expect_true(all(c("press_seq", "deriv1", "deriv1_ci_low",
    "deriv1_ci_up") %in% names(dat)))
  # test rows
  expect_true(all(b$id %in% dat$id))
  # test generated data
  expect_is(dat$press_seq[[1]], "numeric")
  expect_is(dat$deriv1[[1]], "numeric")
  expect_is(dat$deriv1_ci_low[[1]], "numeric")
  expect_is(dat$deriv1_ci_up[[1]], "numeric")
})
