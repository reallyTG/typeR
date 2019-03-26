context("test cooks_dist_gamm")

ind <- ind_init_ex$ind_train[[67]]
press <- ind_init_ex$press_train[[67]]
lmc <- nlme::lmeControl(niterEM = 5000, msMaxIter = 1000)
gamm_model <- mgcv::gamm(ind ~ s(press, k = 5), control = lmc)$gam
mdf <- stats::model.frame(gamm_model)$press
# rn <- rownames(mdf)
n <- length(mdf)
k <- 1
# mdf[,2] == press
SS_x <- sum((mdf - mean(mdf, na.rm = TRUE))^2, na.rm = TRUE)
mean_x <- mean(mdf, na.rm = TRUE)
# model == gam-objekt
res <- stats::residuals(gamm_model)
df_error <- n - k - 1
SS_error <- sum(res^2, na.rm = TRUE)  #model$residuals == res!
MS_error <- SS_error/df_error

h <- ((mdf - mean_x)^2/SS_x) + 1/n
D <- (res^2/((k + 1) * MS_error)) * (h/(1 - h)^2)
attributes(D) <- NULL

test_that("test output", {
  expect_is(cooks_dist_gamm(gamm_model = model_gamm_ex$model[[1]]$gam)[1],
    "numeric")
  expect_equal(length(cooks_dist_gamm(gamm_model = model_gamm_ex$model[[2]]$gam)),
    length(ind_init_ex$ind_train[[43]]))
  expect_equal(cooks_dist_gamm(gamm_model = model_gamm_ex$model[[103]]$gam),
    D)
})
