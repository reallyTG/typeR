context("test calc_nrmse")

# General test
press <- ind_init_ex$press_test
ind <- ind_init_ex$ind_test
model <- all_results_ex$model

test_nrmse <- calc_nrmse(press, ind, model, method = "mean")

test_that("test output format", {
  expect_is(test_nrmse, "numeric")
  expect_identical(length(test_nrmse), nrow(all_results_ex))
  expect_true(all(test_nrmse >= 0))
})

# Test input validation routine
test_that("test error messages", {
  expect_error(calc_nrmse(press, ind, model, method = "stdev"),
    "You specified the wrong method!")
  expect_error(calc_nrmse(press, ind, model, transformation = "LOG"),
    "You specified the wrong transformation!")
  expect_error(calc_nrmse(press, ind, model, transformation = "other"),
    "You need to specify the trans_function ")
  expect_error(calc_nrmse(press, ind, model, method = rep("sd",
    2)), "Argument 'method' has to be either ")
  expect_error(calc_nrmse(press, ind, model, transformation = rep("log",
    2)), "Argument 'transformation' has to be either ")
  expect_error(calc_nrmse(press, ind, model, trans_function = rep("none",
    2)), "Argument 'trans_function' has to be either ")
  expect_error(calc_nrmse(press[1:2], ind[1:2], model[1:2],
    transformation = c("log", "other"), trans_function = rep("none",
      2)), "You need to specify the trans_function for ")
})


# Test output (when using 'sd' method)

# TZA
press_df <- data.frame(ind_init_ex$press_test[[7]])
names(press_df) <- ind_init_ex$press[[7]]
pred_tza <- predict(all_results_ex$model[[7]], newdata = press_df)
obs_tza <- ind_init_ex$ind_test[[7]]
tza_comp <- nrmse(pred = pred_tza, obs = obs_tza,
  transformation = "log")
tza_comp2 <- nrmse(pred = pred_tza, obs = obs_tza,
  transformation = "other", trans_function = "exp(x)- 0.001")

# MS
press_df <- data.frame(ind_init_ex$press_test[[8]])
names(press_df) <- ind_init_ex$press[[8]]
pred_ms <- predict(all_results_ex$model[[8]], newdata = press_df)
obs_ms <- ind_init_ex$ind_test[[8]]
ms_comp <- nrmse(pred = pred_ms, obs = obs_ms)

nrmse_comp <- c(tza_comp, tza_comp2, ms_comp)

# now with the wrapper function
test_nrmse <- calc_nrmse(press <- ind_init_ex$press_test[c(7,
  7, 8)], ind <- ind_init_ex$ind_test[c(7, 7, 8)],
  model <- all_results_ex$model[c(7, 7, 8)], method = "sd",
  transformation = c("log", "other", "none"), trans_function = c("none",
    "exp(x)- 0.001", "none"))

test_that("test other output", {
  expect_equal(nrmse_comp, test_nrmse)
})


# Test NAs in pred or model

press <- list(rep(NA, 4), c(10, 15, 20, 15))
press2 <- list(c(9, 13, 20, 17), c(10, 15, 20, 15))
ind <- list(c(10, 13, 15, 15), c(20, 15, 17, 14))
model <- model_gam_ex$model[1:2]
model2 <- list(model_gam_ex$model[[1]], NA)
test_nrmse <- calc_nrmse(press = press, ind = ind,
  model = model)
test_nrmse2 <- calc_nrmse(press = press2, ind = ind,
  model = model2)

test_that("test other output", {
  expect_true(is.na(test_nrmse[1]))
  expect_true(!is.na(test_nrmse[2]))
  expect_true(!is.na(test_nrmse2[1]))
  expect_true(is.na(test_nrmse2[2]))
})



# Test that NAs are returned when in every test
# time step at least 1 NA in IND or PRESS

press_tbl <- press_ex[, 2:3]  # excl. Year
ind_tbl <- ind_ex[, 2:3]  # excl. Year
time <- ind_ex[, 1]
press_tbl$Tsum[28:30] <- NA
x <- ind_init(ind_tbl, press_tbl, time, train = 0.9,
  random = FALSE)
y <- model_gam(x)

test_that("test NA return", {
  expect_true(is.na(y$nrmse[1]))
  expect_true(is.na(y$nrmse[3]))
})



# Compare application of function alone vs within
# model_gam

gam_nrmse <- calc_nrmse(press = ind_init_ex$press_test[30:35],
  ind = ind_init_ex$ind_test[30:35], model = model_gam_ex$model[30:35])

test_gam <- model_gam(ind_init_ex[30:35, ])

test_that("test external vs internal application", {
  expect_equal(gam_nrmse, test_gam$nrmse)
})
