context("test model_trend")

dat <- model_trend(ind_ex[, -1], time = ind_ex[, 1])
ind <- ind_ex[, 12]  # SPF
time <- ind_ex[, 1]
model <- mgcv::gam(ind ~ 1 + s(time, k = 4), na.action = "na.omit")
p_val <- get_sum_output(list(mgcv::summary.gam(model)),
  "s.table", cell = 4)

test_that("correct output", {
  expect_equal(names(INDperform::ind_ex[, -1]), dat$ind)
  expect_equal(dat$ind_id, 1:ncol(INDperform::ind_ex[,
    -1]))
  expect_equal(model$model$press, dat$model[[11]]$model$press)
  expect_true(length(dat$model[[1]]$model$time) !=
    length(dat$model[[11]]$model$time))
  expect_equal(p_val, dat$p_val[11])
})


dat2 <- model_trend(ind_ex[, -1], time = ind_ex[, 1],
  train = 0.5, random = TRUE)

test_that("test the NA vector", {
  expect_equal(length(dat$model[[1]]$train_na), length(time))
  expect_equal(sum(dat$model[[1]]$train_na), 0)
  expect_equal(sum(dat2$model[[1]]$train_na == FALSE),
    15)
})


dat <- ind_ex[, 2:3]
dat$TZA <- as.factor(dat$TZA)
dat2 <- ind_ex[, 4:7]
dat2$ind_na <- NA_real_

test_that("error messages", {
  expect_error(model_trend(time = ind_ex[, -1]),
    "Argument ind_tbl is missing")
  expect_error(model_trend(ind_tbl = ind_ex[, -1]),
    "Argument time is missing")
  expect_error(model_trend(ind_ex[, -1]), "Argument time is missing")
  expect_error(model_trend(ind_ex[, -1], time = ind_ex[,
    -1]), "time has to be a VECTOR!")
  expect_error(model_trend(ind_ex[, -1], time = as.factor(ind_ex$Year)),
    "not a factor!")
  expect_error(model_trend(ind_ex[, -1], time = as.character(ind_ex$Year)),
    "time has to be an INTEGER vector!")
  expect_error(model_trend(dat, time = ind_ex$Year),
    "have to be NUMERIC!")
  expect_error(model_trend(ind_ex[, -1], time = ind_ex$Year[-1]),
    "The number of time steps")
  expect_error(model_trend(ind_ex[, -1], time = ind_ex$Year,
    train = 1.5), "The train argument has to be")
  expect_error(model_trend(ind_ex[, -1], time = ind_ex$Year,
    train = 1.5), "The train argument has to be")
  expect_error(model_trend(ind_ex[, -1], time = ind_ex$Year,
    family = poisson), "The specified family is not")
  # Fitting procedure failed
  expect_error(model_trend(ind_tbl = ind_ex[, 4:7],
    time = ind_ex$Year, family = binomial()), "No indicator trend model could be fitted!")
  expect_message(model_trend(ind_tbl = dat2, time = ind_ex$Year),
    "For the following indicators fitting procedure failed")
})


test_that("correct indicator name for vectors", {
  expect_true(model_trend(ind_ex$MS, time = ind_ex$Year)$ind[1] ==
    "ind")
  expect_true(model_trend(data.frame(y = ind_ex$MS),
    time = ind_ex$Year)$ind[1] == "y")
})
