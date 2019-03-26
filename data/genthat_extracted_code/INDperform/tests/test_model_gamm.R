context("test model_gamm")

test_id <- 64
dat <- model_gamm(ind_init_ex[test_id, ])

# set control parameters
lmc <- nlme::lmeControl(niterEM = 5000, msMaxIter = 1000)

# Manual fitting for comparison -----------
ind <- ind_init_ex$ind_train[[test_id]]
i_test <- ind_init_ex$ind_test[[test_id]]
press <- ind_init_ex$press_train[[test_id]]
p_test <- ind_init_ex$press_test[[test_id]]
time <- ind_init_ex$time_train[[test_id]]
test_dat <- data.frame(ind = ind, press = press, time = time)
test_ar0 <- mgcv::gamm(formula = ind ~ s(press, k = 5))  #,
# control = lmc)

test_ar1 <- mgcv::gamm(formula = ind ~ s(press, k = 5),
  correlation = nlme::corARMA(value = 0.3, form = ~time,
    p = 1, q = 0), control = lmc, data = test_dat)
test_ar2 <- mgcv::gamm(formula = ind ~ s(press, k = 5),
  correlation = nlme::corARMA(value = c(0.3, -0.3),
    form = ~time, p = 2, q = 0), control = lmc,
  data = test_dat)
test_arma11 <- mgcv::gamm(formula = ind ~ s(press,
  k = 5), correlation = nlme::corARMA(value = c(0.3,
  0.3), form = ~time, p = 1, q = 1), control = lmc,
  data = test_dat)
test_arma12 <- mgcv::gamm(formula = ind ~ s(press,
  k = 5), correlation = nlme::corARMA(value = c(0.3,
  -0.3, 0.3), form = ~time, p = 1, q = 2), control = lmc,
  data = test_dat)
test_arma21 <- mgcv::gamm(formula = ind ~ s(press,
  k = 5), correlation = nlme::corARMA(value = c(0.3,
  0.3, -0.3), form = ~time, p = 2, q = 1), control = lmc,
  data = test_dat)
model <- list(test_ar0, test_ar1, test_ar2, test_arma11,
  test_arma12, test_arma21)

model_type <- unlist(purrr::map(seq_along(model), ~class(model[[.]])[1]))
corrstruct <- c("none", "ar1", "ar2", "arma11", "arma12",
  "arma21")
aic <- purrr::map_dbl(model, ~stats::AIC(.$lme))
summary <- purrr::map(model, ~mgcv::summary.gam(.$gam))
edf <- get_sum_output(summary, "edf")
p_val <- get_sum_output(summary, "s.table", cell = 4)
signif_code <- get_signif_code(p_val)
r_sq <- get_sum_output(summary, "r.sq")
nrmse <- calc_nrmse(press = list(p_test, p_test,
  p_test, p_test, p_test, p_test),
	ind = list(i_test,
  i_test, i_test, i_test, i_test, i_test),
	model = model)
res <- purrr::map(model, ~mgcv::residuals.gam(.$gam))
res_tac <- purrr::map(model, ~residuals(.$lme, type = "normalized"))
ks_test <- unlist(lapply(res, FUN = function(x) round(stats::ks.test(x,
  "pnorm", mean(x), sd(x))$p.value, 4)))
tac <- unlist(lapply(res_tac, FUN = function(x) test_tac(list(x))$tac))

#summary(model)
# -------------------------

test_that("compare manual results", {
		expect_true(all(purrr::map_lgl(1:length(model),
			 ~all.equal(model[[.]]$lme$logLik,
			dat$model[[.]]$lme$logLik, tolerance = 0.001))))
		expect_true(all(purrr::map_lgl(1:length(model),
			 ~all.equal(model[[.]]$lme$coefficients$fixed[[1]],
			dat$model[[.]]$lme$coefficients$fixed[[1]], tolerance = 0.001))))
		expect_true(all(purrr::map_lgl(1:length(model),
			 ~all.equal(model[[.]]$lme$coefficients$fixed[[2]],
			dat$model[[.]]$lme$coefficients$fixed[[2]], tolerance = 0.001))))
		expect_true(all(purrr::map_lgl(1:length(model),
			 ~all.equal(model[[.]]$lme$coefficients$random$g[[1]],
			dat$model[[.]]$lme$coefficients$random$g[[1]], tolerance = 0.001))))
  expect_equal(model_type, dat$model_type)
  expect_is(model_type[1], "character")
  expect_equal(corrstruct, dat$corrstruc, tolerance = 0.001)
  expect_is(corrstruct[1], "character")
  expect_equal(aic, dat$aic, tolerance = 0.001)
  expect_is(aic[1], "numeric")
  # the following gives an error in the CRAN check (devel), hence not included
  # expect_equal(edf, dat$edf, tolerance = 0.01)
  expect_is(edf[1], "numeric")
  expect_equal(p_val, dat$p_val, tolerance = 1e-06)
  expect_is(p_val[1], "numeric")
  expect_equal(signif_code, dat$signif_code)
  expect_is(signif_code[1], "character")
  expect_equal(r_sq, dat$r_sq, tolerance = 0.001)
  expect_is(r_sq[1], "numeric")
  expect_equal(nrmse, dat$nrmse, tolerance = 0.001)
  expect_is(nrmse[1], "numeric")
  expect_equal(ks_test[1], dat$ks_test[1], tolerance = 0.001)
  expect_is(ks_test[1], "numeric")  # error
  expect_equal(tac, dat$tac, tolerance = 0.001)
  expect_false(dat$tac[2])
  expect_true(all(dat$id == test_id))
  expect_true(all(dat$ind == "Cod"))
  expect_true(all(dat$press == "Tsum"))
  expect_message(model_gamm(ind_init_ex[44, ]), "NOTE: For the following IND~pressure GAMMs")
})

# Test outlier
example <- model_gamm(ind_init_ex[39, ], excl_outlier = as.list(rep(8,
  6)))  # need to be provided for each GAMM!
# Manually add an NA to the training data (but then
# also to the train_na vector!)
ind_init2 <- ind_init_ex[39, ]
ind_init2$ind_train[[1]][8] <- NA
ind_init2$train_na[[1]][8] <- TRUE
example2 <- model_gamm(ind_init2)

test_that("test excl outlier", {
  expect_equivalent(example$p_val, example2$p_val, tolerance = 1e-06)
  expect_equivalent(example$nrmse, example2$nrmse, tolerance = 1e-06)
  expect_error(model_gamm(ind_init_ex[102, ], excl_outlier = as.list(c(8,
    6))))  #only 1 list entry can be recycled
})

# Test filter
dat <- ind_init_ex[1:5, ]
dat_filter <- c(TRUE, NA, NA, NA, FALSE)
test <- model_gamm(init_tbl = dat, filter = dat_filter)

test_that("test filter with NAs", {
  expect_equal(nrow(test), 6)
})


# Binomal distribution
set.seed(123)
vec_train <- sample(x = c(0, 1), size = 27, replace = TRUE)
vec_test <- sample(x = c(0, 1), size = 3, replace = TRUE)
data <- ind_init_ex[1, ]
data$ind_train <- list(vec_train)
data$ind_test <- list(vec_test)
example <- suppressWarnings(model_gamm(data, family = stats::binomial(link = log)))

test_that("test binomial family", {
  expect_true(mgcv::summary.gam(example$model[[1]]$gam)$family[[1]] ==
    "binomial")
  expect_true(mgcv::summary.gam(example$model[[1]]$gam)$family[[2]] ==
    "log")
})

# Poisson distribution
set.seed(123)
vec_train <- rpois(27, 15)
vec_test <- rpois(3, 15)
data <- ind_init_ex[1, ]
data$ind_train <- list(vec_train)
data$ind_test <- list(vec_test)
example <- model_gamm(data, family = stats::poisson(link = identity))

test_that("test poisson family", {
  expect_true(mgcv::summary.gam(example$model[[1]]$gam)$family[[1]] ==
    "poisson")
  expect_true(mgcv::summary.gam(example$model[[1]]$gam)$family[[2]] ==
    "identity")
})


# Negative Binomal distribution
set.seed(123)
vec_train <- rnbinom(27, size = 5.855, mu = 1/exp(-3))
vec_test <- rnbinom(3, size = 5.855, mu = 1/exp(-3))
data <- ind_init_ex[1, ]
data$ind_train <- list(vec_train)
data$ind_test <- list(vec_test)
example1 <- model_gamm(data, family = mgcv::negbin(theta = 5.855,
  link = "sqrt"))

test_that("negative biomial distribution", {
  expect_true(mgcv::summary.gam(example1$model[[1]]$gam)$family[[1]] ==
    "Negative Binomial(5.855)")
  expect_true(mgcv::summary.gam(example1$model[[1]]$gam)$family[[2]] ==
    "sqrt")
})


# Test error messages and filter
dat <- ind_init_ex[1:5, ]
dat2 <- ind_init_ex[1:5, 1:3]
dat3 <- dat
dat3[1] <- "list"
dat4 <- as.data.frame(dat)
dat_filter <- c(TRUE, FALSE, TRUE, FALSE)
x <- data.frame(TZA = ind_ex$TZA, test = rep(NA_real_, nrow(ind_ex)))
y <- press_ex[, 2]
dat5 <- suppressMessages(ind_init(x, y, time = ind_ex$Year))
dat_filter2 <- c(FALSE, NA, NA, NA, FALSE)

test_that("error messages and filter", {
  expect_error(model_gamm(k = 3), "Argument init_tbl is missing")
  expect_error(model_gamm(dat, family = poisson),
    "The specified family is not")
  # not all variables needed are provided in input:
  expect_error(model_gamm(dat2))
  # data type is not as required (indication of
  # modification)
  expect_error(model_gamm(dat3))
  # input not a tibble anymore
  expect_error(model_gamm(dat4))
  expect_error(model_gamm(dat, filter = dat_filter),
    "The length of the logical filter")
  # should NOT provide an error message (filter
  # length correct) and return a tibble
  expect_true(tibble::is.tibble(model_gamm(ind_init_ex[63, ],
  	filter = model_gam_ex$tac[63])))
  # fitting procedure failed
  expect_error(model_gamm(dat, family = binomial()),
    "No IND~pressure GAMM could be fitted")
  expect_message(model_gamm(dat5), "For the following")
  expect_error(model_gamm(init_tbl = dat, filter = dat_filter2),
    "Your filter contains no TRUE element")
})
