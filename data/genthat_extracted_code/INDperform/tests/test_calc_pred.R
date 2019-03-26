context("test calc_pred")

model_list <- model_gam_ex$model
obs_press <- ind_init_ex$press_train
dat <- calc_pred(model_list, obs_press)

ind <- ind_init_ex$ind_train[[45]]
press <- ind_init_ex$press_train[[45]]
test_gam <- mgcv::predict.gam(mgcv::gam(ind ~ 1 + s(press,
  k = 5)), type = "response")
# Dont join ind_init_ex and model_gamm_ex by ID!!!
dummy <- dplyr::left_join(model_gamm_ex, ind_init_ex,
  by = c("ind", "press"))
model_list <- dummy$model
obs_press <- dummy$press_train
dat2 <- calc_pred(model_list, obs_press)

lmc <- nlme::lmeControl(niterEM = 5000, msMaxIter = 1000)
test_gamm <- mgcv::predict.gam(dummy$model[[37]]$gam,
  type = "response")

test_that("test calc_pred", {
  expect_equal(unique(vapply(dat$pred, length, integer(1))),
    27)
  expect_equal(as.vector(dat$pred[[45]][!is.na(ind)]),
    as.vector(test_gam))
  # (dimnames differ, hence, wrapped in vectors)
  expect_true(unique(vapply(dat2$pred, length, integer(1)) ==
    27 | 1))
  expect_equal(dat2$pred[[37]], test_gamm)
  expect_is(dat2$pred[is.na(model_gamm_ex$model)][[1]],
    "logical")
  expect_is(dat$pred[[71]][1], "numeric")
  expect_is(dat2$pred[[37]][1], "numeric")
})
