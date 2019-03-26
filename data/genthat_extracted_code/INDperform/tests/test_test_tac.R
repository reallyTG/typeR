context("test test_tac")

model_resid <- purrr::map(model_gam_ex$model,
	 ~stats::residuals.glm(., type = "deviance"))
dat <- test_tac(model_resid)
test <- purrr::map(ind_init_ex$ind_train, ~!is.na(.))
test <- vapply(test, sum, integer(1))

test_that("test test_tac", {
  expect_is(dat$tac, "logical")
  expect_true(dat$tac[67])
  expect_equal(typeof(dat$acf[[1]]), "double")
  expect_true(all(vapply(dat$acf[test > 19], length,
    integer(1)) == 15))
  expect_true(all(vapply(dat$acf[test < 20], length,
    integer(1)) == 13))
  expect_true(all(vapply(dat$pacf[test > 19], length,
    integer(1)) == 14))
  expect_true(all(vapply(dat$pacf[test < 20], length,
    integer(1)) == 12))
  expect_equal(typeof(dat$pacf[[1]]), "double")
  expect_equal(dat$acf[[1]], as.vector(acf(model_resid[[1]],
    plot = FALSE, na.action = stats::na.pass)$acf))
})
