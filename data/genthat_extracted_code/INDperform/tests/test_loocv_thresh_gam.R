context("test loocv_thresh_gam")

ind <- ind_init_ex$ind_train[[1]]
press <- ind_init_ex$press_train[[1]]
t_var <- ind_init_ex$press_train[[2]]
time <- ind_init_ex$time_train[[1]]
model <- model_gam_ex$model[[1]]
test <- loocv_thresh_gam(model, ind, press, t_var,
  "Ssum", k = 4, a = 0.2, b = 0.8, time)

# now with error message in $error
dat_init <- ind_init(ind_tbl = ind_ex[, "Cod"], press_tbl = press_ex[,
  c("Tsum", "Fcod")], time = ind_ex[, 1], train = 0.2)
gam_tbl <- model_gam(dat_init)
ind_vec <- dat_init$ind_train[[2]]
press_vec <- dat_init$press_train[[2]]
t_var_vec <- dat_init$press_train[[1]]
time <- dat_init$time_train[[2]]
model <- gam_tbl$model[[2]]
test2 <- loocv_thresh_gam(model, ind_vec, press_vec,
  t_var_vec, name_t_var = "Tsum", k = 4, a = 0.2,
  b = 0.8, time)

test_that("test output loocv for threshold-GAM", {
  expect_false(test$result)
  expect_true(is.na(test$error))
  expect_true(is.na(test2$result))
  expect_equal(test2$error, "Model has more coefficients than data")
})
