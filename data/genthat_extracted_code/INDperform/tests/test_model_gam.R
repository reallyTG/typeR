context("test model_gam")

dat <- model_gam(ind_init_ex)
# as summary was removed from output tibble
dat$summary <- purrr::map(dat$model, ~mgcv::summary.gam(.))
ind <- ind_init_ex$ind_train[[71]]
press <- ind_init_ex$press_train[[71]]

# Manual fitting and result extraction
model <- mgcv::gam(ind ~ 1 + s(press, k = 5))  #, family = gaussian(link = 'identity'))
summary <- mgcv::summary.gam(model)
aic <- stats::AIC(model)
edf <- get_sum_output(list(summary), "edf")
p_val <- get_sum_output(list(summary), "s.table", cell = 4)
sig_code <- get_signif_code(p_val)
r_sq <- get_sum_output(list(summary), "r.sq")
nrmse <- calc_nrmse(ind_init_ex$press_test[71],
  ind_init_ex$ind_test[71], dat$model[71])
res <- mgcv::residuals.gam(model, type = "deviance")
ks_test <- round(stats::ks.test(res, "pnorm", mean(res),
  sd(res))$p.value, 4)
place_resid <- purrr::map(purrr::map(list(cbind(ind,
  press)), ~is.na(.)), ~!as.logical(apply(X = .,
  MARGIN = 1, FUN = max)))[[1]]
res_new <- NULL
res_new[place_resid] <- res
tac <- test_tac(list(res_new))$tac

test_that("test the returned tibble", {
  expect_equal(dat[, 1:3], model_gam_ex[, 1:3])
  expect_equal(ind_init_ex[, 1:3], model_gam_ex[,
    1:3])
  expect_equal(ind_init_ex[, 1:3], model_gam_ex[,
    1:3])
  expect_equivalent(vapply(dat[, 6:14], class, character(1)),
    c("numeric", "numeric", "numeric", "character",
      "numeric", "numeric", "numeric", "numeric",
      "logical"))
  expect_equal(dat$aic[[71]], aic)
  expect_equal(dat$edf[[71]], edf)
  expect_equal(dat$p_val[[71]], p_val)
  expect_equal(dat$signif_code[[71]], sig_code)
  expect_equal(dat$r_sq[[71]], r_sq)
  expect_equal(dat$nrmse[[71]], nrmse)
  expect_equal(dat$ks_test[[71]], ks_test)
  expect_equal(dat$tac[[71]], tac)
  expect_is(dat$model, "list")
  expect_equal(dat$aic[[71]], aic)
  expect_is(dat$summary, "list")
  expect_equivalent(dat$model[[71]]$model$SPF, model$model$ind)  #not equal duo to names!
})


test_that("test excl outlier", {
  example <- model_gam(ind_init_ex[46, ])
  example2 <- model_gam(ind_init_ex[46, ], excl_outlier = example$pres_outlier)
  ind_init2 <- ind_init_ex[46, ]
  ind_init2$ind_train[[1]][5] <- NA
  ind_init2$train_na[[1]][5] <- TRUE  # needs also to be set to NA == TRUE
  example3 <- model_gam(ind_init2)
  expect_equivalent(example2$p_val, example3$p_val)
  expect_equivalent(example2$expl_dev, example3$expl_dev)
})

# Binomial distribution
set.seed(123)
vec_train <- sample(x = c(0, 1), size = 27, replace = TRUE)
vec_test <- sample(x = c(0, 1), size = 3, replace = TRUE)
data <- ind_init_ex[1, ]
data$ind_train <- list(vec_train)
data$ind_test <- list(vec_test)
example <- suppressWarnings(model_gam(data, family = stats::binomial(link = log)))

test_that("test binomial family", {
  expect_true(mgcv::summary.gam(example$model[[1]])$family[[1]] ==
    "binomial")
  expect_true(mgcv::summary.gam(example$model[[1]])$family[[2]] ==
    "log")
})

# Poisson distribution
set.seed(123)
vec <- rpois(27, 15)
data <- ind_init_ex[1, ]
data$ind_train <- list(vec)
example <- model_gam(data, family = stats::poisson(link = identity))

test_that("test poisson family", {
  expect_true(mgcv::summary.gam(example$model[[1]])$family[[1]] ==
    "poisson")
  expect_true(mgcv::summary.gam(example$model[[1]])$family[[2]] ==
    "identity")
})


# Negative Binomal distribution
set.seed(123)
vec <- rnbinom(27, size = 5.855, mu = 1/exp(-3))
data <- ind_init_ex[1, ]
data$ind_train <- list(vec)
example1 <- model_gam(data, family = mgcv::negbin(theta = 5.855,
  link = "sqrt"))
# mgcv::nb() works only for gam() not gamm()!!!!!
example2 <- model_gam(data, family = mgcv::nb())

test_that("negative biomial distribution", {
  expect_true(mgcv::summary.gam(example1$model[[1]])$family[[1]] ==
    "Negative Binomial(5.855)")
  expect_true(mgcv::summary.gam(example1$model[[1]])$family[[2]] ==
    "sqrt")
  expect_true(mgcv::summary.gam(example2$model[[1]])$family[[1]] ==
    "Negative Binomial(4.461)")
  expect_true(mgcv::summary.gam(example2$model[[1]])$family[[2]] ==
    "log")
})


# Test error messages
dat <- ind_init_ex[1:5, ]
dat2 <- ind_init_ex[1:5, 1:3]
dat3 <- dat
dat3[1] <- "list"
dat4 <- as.data.frame(dat)
x <- ind_ex[, 4:5]
x$test_ind <- NA_real_
y <- press_ex[, 2]
dat5 <- suppressMessages(ind_init(x, y, time = ind_ex$Year))


test_that("error messages", {
  expect_error(model_gam(k = 3), "Argument init_tbl is missing")
  expect_error(model_gam(dat, family = poisson),
    "The specified family is not")
  # not all variables needed are provided in input:
  expect_error(model_gam(dat2))
  # data type is not as required (indication of
  # modification)
  expect_error(model_gam(dat3))
  # input not a tibble anymore
  expect_error(model_gam(dat4))
  # fitting procedure failed
  expect_error(model_gam(dat, family = binomial()),
    "No IND~pressure GAM could be fitted")
  expect_message(model_gam(dat5), "NOTE: For the following")
})
