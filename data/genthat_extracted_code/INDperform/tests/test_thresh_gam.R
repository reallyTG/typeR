context("test thresh_gam")

ind <- ind_init_ex$ind_train[[1]]
press1 <- ind_init_ex$press_train[[1]]
press2 <- ind_init_ex$press_train[[2]]
model <- model_gam_ex$model[[1]]
test <- thresh_gam(model, ind, press1, press2, "Ssum",
  k = 4, a = 0.2, b = 0.8)

test_that("test t_gam", {
  expect_equal(all.vars(test$formula), c("TZA", "Tsum",
    "Ssum"))
  expect_equal(length(test$gcvv), length(press1) +
    1)
  expect_equal(test$mgcv, min(test$gcvv, na.rm = TRUE))
  expect_equal(sort(press1), sort(c(press1[press2 <=
    test$mr], press1[press2 > test$mr])))
  expect_true(any(test$t_val == test$mr))
})
