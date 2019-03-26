context("Hyperparameter Estimation")
#For testing if the functions that explore the hyperparameter space are
#functioning correctly

dat <-
  data.frame(var1 = c("product_A", rep("product_B", 3), "product_C",
                      rep("product_A", 2), rep("product_B", 2), "product_C"),
             var2 = c("event_1", rep("event_2", 2), rep("event_3", 2),
                      "event_2", rep("event_3", 3), "event_1"),
             strat1 = c(rep("Male", 5), rep("Female", 3), rep("Male", 2)),
             strat2 = c(rep("age_cat1", 5), rep("age_cat1", 3),
                        rep("age_cat2", 2))
             )
dat$id <- 1:nrow(dat)
dat_processed <- processRaw(dat)

dat_miss <- dat_processed
dat_miss[2, "E"] <- NA

theta_init <- data.frame(alpha1 = c(0.2, 0.1, 0.3),
                         beta1  = c(0.1, 0.1, 0.5),
                         alpha2 = c(2, 10, 6),
                         beta2  = c(4, 10, 6),
                         p      = c(1/3, 0.2, 0.5))

theta_init_neg <- theta_init
theta_init_neg[1, 3] <- -0.5
theta_init_too_big <- theta_init
theta_init_too_big[1, 5] <- 1.1

proc_zeroes <- processRaw(dat, zeroes = TRUE)

data(caers)
proc_dat_ustrat <- processRaw(caers, stratify = FALSE)
proc_dat_ustrat_squash <- squashData(proc_dat_ustrat, bin_size = 80,
                                     keep_pts = 80)
proc_dat_ustrat_squash <- squashData(proc_dat_ustrat_squash, count = 2,
                                     bin_size = 12, keep_pts = 12)

#Begin exception handling tests ------------------------------------------------
#exploreHypers()
testthat::test_that("see if exploreHypers() errors are correctly printed", {
  expect_error(exploreHypers(data = proc_dat_ustrat[, c("E", "RR", "PRR")],
                             theta_init = theta_init,
                             squashed = FALSE, zeroes = FALSE, N_star = 1),
               "missing the appropriate column names (need 'N' and 'E')",
               fixed = TRUE)
  expect_error(exploreHypers(data = dat_miss, theta_init = theta_init,
                             squashed = FALSE, zeroes = FALSE, N_star = 1),
               "missing or infinite values for 'N' and 'E' are not allowed",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat, theta_init = theta_init,
                             squashed = 0, zeroes = FALSE, N_star = 1),
               "'squashed' and 'zeroes' must be logical values",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat, theta_init = theta_init,
                             squashed = FALSE, std_errors = 1),
               "'std_errors' must be a logical value",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_zeroes, theta_init = theta_init,
                             squashed = FALSE, zeroes = TRUE, N_star = 1),
               "if zeroes are used, 'N_star' should be NULL",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat, theta_init = theta_init,
                             squashed = FALSE, zeroes = TRUE, N_star = NULL),
               "no zero counts found",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_zeroes, theta_init = theta_init,
                             squashed = FALSE, zeroes = FALSE, N_star = 1),
               "zero counts found",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat, theta_init = theta_init,
                             squashed = FALSE, zeroes = FALSE,
                             N_star = -1),
               "'N_star' must be NULL or a positive whole number",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat, theta_init = theta_init,
                             squashed = FALSE, zeroes = FALSE,
                             N_star = 0),
               "'N_star' must be NULL or a positive whole number",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat, theta_init = theta_init,
                             squashed = FALSE, zeroes = FALSE,
                             N_star = 2),
               "'N_star' does not agree with the data set",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat, theta_init = theta_init,
                             squashed = FALSE, zeroes = FALSE, N_star = 1,
                             max_pts = 10000),
               paste0("there are more than 10000 points --",
                      "\n  either squash data, run individual optimizations,",
                      "\n  or increase 'max_pts' (caution: long run times)"),
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat, theta_init = theta_init[, 1:4],
                             squashed = FALSE, zeroes = FALSE, N_star = 1),
               "'theta_init' must contain 5 columns",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat, theta_init = theta_init_neg,
                             squashed = FALSE, zeroes = FALSE, N_star = 1),
               "'theta_init' must contain nonnegative values",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat,
                             theta_init = theta_init_too_big,
                             squashed = FALSE, zeroes = FALSE, N_star = 1),
               "'theta[5]' (i.e., 'P') must be <1",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat, theta_init = theta_init,
                             squashed = TRUE,
                             zeroes = FALSE, N_star = 1),
               "'weight' column is missing -- are these data really squashed?",
               fixed = TRUE)
  expect_error(exploreHypers(data = proc_dat_ustrat_squash,
                             theta_init = theta_init, squashed = FALSE,
                             zeroes = FALSE, N_star = 1),
               "'weight' column was found -- were these data squashed?",
               fixed = TRUE)
})

#hyperEM()
testthat::test_that("see if hyperEM() errors are correctly printed", {
  expect_error(hyperEM(proc_dat_ustrat, theta_init_vec = c(1, 1, 2, 2, .3),
                       squashed = FALSE, N_star = 2),
               "if 'method' is 'score', N_star must be 1 or NULL",
               fixed = TRUE)
  expect_error(hyperEM(dat_miss, theta_init_vec = c(1, 1, 2, 2, .3),
                       squashed = FALSE),
               "missing or infinite values for 'N' and 'E' are not allowed",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat, theta_init_vec = c(1, 1, 2, 2, .3),
                       squashed = 0),
               "'squashed' and 'zeroes' must be logical values",
               fixed = TRUE)
  expect_error(hyperEM(proc_zeroes, theta_init_vec = c(1, 1, 2, 2, .3),
                       squashed = FALSE, zeroes = TRUE, N_star = 1),
               "if zeroes are used, 'N_star' should be NULL",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat, theta_init_vec = c(1, 1, 2, 2, .3),
                       squashed = FALSE, zeroes = TRUE, N_star = NULL),
               "no zero counts found",
               fixed = TRUE)
  expect_error(hyperEM(proc_zeroes, theta_init_vec = c(1, 1, 2, 2, .3),
                       squashed = FALSE, zeroes = FALSE, N_star = 1),
               "zero counts found",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat, theta_init_vec = c(1, 1, 2, 2, .3),
                       method = "nlminb", squashed = FALSE, zeroes = FALSE,
                       N_star = -1),
               "'N_star' must be NULL or a positive whole number",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat, theta_init_vec = c(1, 1, 2, 2, .3),
                       method = "nlminb", squashed = FALSE, zeroes = FALSE,
                       N_star = 2),
               "'N_star' does not agree with the data set",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat, theta_init_vec = c(1, 1, 2, 2),
                             squashed = FALSE),
               "'theta_init_vec' must contain 5 elements",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat, theta_init_vec = c(1, 1, NA, 2, .3),
                       squashed = FALSE),
               "'theta_init_vec' cannot contain missing values",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat, theta_init_vec = c(1, 1, 2, 2, 0),
                       squashed = FALSE),
               "'theta_init_vec' must contain positive numeric values",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat, theta_init_vec = c(1, 1, 2, 2, 1),
                       squashed = FALSE),
               "'theta_init_vec[5]' (i.e., 'P') must be <1",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat, theta_init_vec = c(1, 1, 2, 2, .3),
                       squashed = TRUE, zeroes = FALSE, N_star = 1),
               "'weight' column is missing -- are these data really squashed?",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat_squash, theta_init_vec = c(1, 1, 2, 2, .3),
                       squashed = FALSE, zeroes = FALSE, N_star = 1),
               "'weight' column was found -- were these data squashed?",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat_squash, theta_init_vec = c(1, 1, 2, 2, .3),
                       LL_tol = ".001"),
               "'LL_tol' must be a positive numeric value",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat_squash, theta_init_vec = c(1, 1, 2, 2, .3),
                       LL_tol = 0),
               "'LL_tol' must be a positive numeric value",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat_squash, theta_init_vec = c(1, 1, 2, 2, .3),
                       consecutive = 10.5),
               "'consecutive' must be a nonnegative whole number",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat_squash, theta_init_vec = c(1, 1, 2, 2, .3),
                       max_iter = 0),
               "'max_iter' must be a positive whole number",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat_squash, theta_init_vec = c(1, 1, 2, 2, .3),
                       param_lower = 0),
               "'param_lower' must be a positive numeric value",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat_squash, theta_init_vec = c(1, 1, 2, 2, .3),
                       param_lower = 0.01, param_upper = 0.001),
               "'param_lower' must be less than 'param_upper'",
               fixed = TRUE)
  expect_error(hyperEM(proc_dat_ustrat_squash, theta_init_vec = c(1, 1, 2, 2, .3),
                       print_level = 3),
               "'print_level' must be 0, 1, or 2",
               fixed = TRUE)
})


#autoHyper() -------------------------------------------------------------------
testthat::test_that("see if autoHyper() errors are correctly printed", {
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = FALSE,
                         tol = c(0.2, 0.4)),
               "'tol' must have a length of 5",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = FALSE,
                         tol = c(0, 0.05, 0.2, 0.2, 0.025)),
               "'tol' must have only positive values",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = FALSE,
                         min_conv = 10),
               paste0("'min_conv' must be a positive number not more than one ",
                      "\n  less than the number of rows in 'theta_init'"),
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = FALSE,
                         min_conv = 0),
               paste0("'min_conv' must be a positive number not more than one ",
                      "\n  less than the number of rows in 'theta_init'"),
               fixed = TRUE)
  expect_error(suppressWarnings(
    autoHyper(data = dat_processed, theta_init = theta_init,
              squashed = FALSE)
    ),
    paste0("consistent convergence failed --",
           "\n  try squashing data with another 'bin_size' value --",
           "\n  if that fails, try using zeroes with data squashing --",
           "\n  or, try using neither zeroes nor data squashing"),
    fixed = TRUE)
  expect_error(suppressWarnings(
    autoHyper(data = dat_processed, theta_init = theta_init,
              squashed = FALSE, conf_ints = 1)
    ),
    "'conf_ints' must be a logical value",
    fixed = TRUE)
  #Common to exploreHypers...
  #Make sure arguments "line up"
  expect_error(autoHyper(data = proc_dat_ustrat[, c("E", "RR", "PRR")],
                         theta_init = theta_init,
                         squashed = FALSE),
               "missing the appropriate column names (need 'N' and 'E')",
               fixed = TRUE)
  expect_error(autoHyper(data = dat_miss, theta_init = theta_init,
                         squashed = FALSE),
               "missing or infinite values for 'N' and 'E' are not allowed",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = 0),
               "'squashed' and 'zeroes' must be logical values",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_zeroes, theta_init = theta_init,
                         squashed = FALSE, zeroes = TRUE),
               "if zeroes are used, 'N_star' should be NULL",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = FALSE, N_star = NULL),
               "if zeroes are not used, 'N_star' must be specified",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = FALSE, zeroes = TRUE, N_star = NULL),
               "no zero counts found",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_zeroes, theta_init = theta_init,
                         squashed = FALSE, zeroes = FALSE),
               "zero counts found",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = FALSE, zeroes = FALSE,
                         N_star = 0),
               "'N_star' must be NULL or a positive whole number",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = FALSE, zeroes = FALSE,
                         N_star = -1),
               "'N_star' must be NULL or a positive whole number",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = FALSE, zeroes = FALSE,
                         N_star = 2),
               "'N_star' does not agree with the data set",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = FALSE, zeroes = FALSE, N_star = 1,
                         max_pts = 10000),
               paste0("there are more than 10000 points --",
                      "\n  either squash data, run individual optimizations,",
                      "\n  or increase 'max_pts' (caution: long run times)"),
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init[, 1:4],
                         squashed = FALSE, zeroes = FALSE, N_star = 1),
               "'theta_init' must contain 5 columns",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init_neg,
                         squashed = FALSE, zeroes = FALSE, N_star = 1),
               "'theta_init' must contain nonnegative values",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat,
                         theta_init = theta_init_too_big,
                         squashed = FALSE, zeroes = FALSE, N_star = 1),
               "'theta[5]' (i.e., 'P') must be <1",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat, theta_init = theta_init,
                         squashed = TRUE,
                         zeroes = FALSE, N_star = 1),
               "'weight' column is missing -- are these data really squashed?",
               fixed = TRUE)
  expect_error(autoHyper(data = proc_dat_ustrat_squash, theta_init = theta_init,
                         squashed = FALSE,
                         zeroes = FALSE, N_star = 1),
               "'weight' column was found -- were these data squashed?",
               fixed = TRUE)
})


#Begin sanity checks -----------------------------------------------------------
hyper_no_squash <- suppressWarnings(
  autoHyper(proc_dat_ustrat[1:10000, ], theta_init = theta_init,
            squashed = FALSE, max_pts = nrow(proc_dat_ustrat))
)
hyper_squash <- suppressWarnings(
  autoHyper(proc_dat_ustrat_squash, theta_init = theta_init,
            max_pts = nrow(proc_dat_ustrat_squash))
)

testthat::test_that("check that a list is being output under correct circumstance", {
  expect_equal(length(hyper_no_squash), 5)
  expect_equal(length(hyper_squash), 5)
  expect_true(is.list(hyper_no_squash))
  expect_true(is.list(hyper_squash))
})

testthat::test_that("check that estimates make sense", {
  expect_equal(length(hyper_no_squash$estimates), 5)
  expect_equal(length(hyper_squash$estimates), 5)
  expect_true(min(hyper_no_squash$estimates) > 0)
  expect_true(min(hyper_squash$estimates) > 0)
  expect_true(max(hyper_no_squash$estimates) < 4)
  expect_true(max(hyper_squash$estimates) < 4)
  expect_true(hyper_no_squash$estimates[5] < 0.2)
  expect_true(hyper_squash$estimates[5] < 0.1)
  expect_true(!any(is.na(hyper_no_squash$estimates)))
  expect_true(!any(is.na(hyper_squash$estimates)))
})

df_method <- squashData(proc_dat_ustrat)
df_method <- squashData(df_method, count = 2, bin_size = 12)
hypers_nlminb <- suppressWarnings(
  exploreHypers(df_method, theta_init = theta_init)$estimates
)

hypers_nlm <- suppressWarnings(
  exploreHypers(df_method, theta_init = theta_init, method = "nlm")$estimates
)

hypers_bfgs <- suppressWarnings(
  exploreHypers(df_method, theta_init = theta_init, method = "bfgs")$estimates
)

testthat::test_that("check if 'nlminb' method works", {
  expect_equal(nrow(hypers_nlminb), 3)
  expect_true(min(hypers_nlminb[, 2:6]) > 0)
  expect_true(max(hypers_nlminb[, 2:5]) < 4)
  expect_true(max(hypers_nlminb[, 6]) < 0.1)
  expect_true(!any(is.na(hypers_nlminb)))
})

testthat::test_that("check if 'nlm' method works", {
  expect_equal(nrow(hypers_nlm), 3)
  expect_true(min(hypers_nlm[, 2:6]) > 0)
  expect_true(max(hypers_nlm[, 2:5]) < 4)
  expect_true(max(hypers_nlm[, 6]) < 0.1)
  expect_true(!any(is.na(hypers_nlm)))
})

testthat::test_that("check if 'bfgs' method works", {
  expect_equal(nrow(hypers_bfgs), 3)
  expect_true(min(hypers_bfgs[, 2:6]) > 0)
  expect_true(max(hypers_bfgs[, 2:5]) < 4)
  expect_true(max(hypers_bfgs[, 6]) < 0.1)
  expect_true(!any(is.na(hypers_bfgs)))
})

#hyperEM()
squashed <- squashData(proc_dat_ustrat, bin_size = 100, keep_pts = 0)
squashed <- squashData(squashed, count = 2, bin_size = 12)
hyperEM_ests <- hyperEM(squashed, theta_init_vec = c(1, 1, 2, 2, .3),
                        print_level = 0)
testthat::test_that("check if hyperEM() works", {
  expect_equal(length(hyperEM_ests), 9)
  expect_true(hyperEM_ests$estimates[1] > 3.00)
  expect_true(hyperEM_ests$estimates[1] < 3.20)
  expect_true(hyperEM_ests$estimates[2] > 0.30)
  expect_true(hyperEM_ests$estimates[2] < 0.50)
  expect_true(hyperEM_ests$estimates[3] > 1.95)
  expect_true(hyperEM_ests$estimates[3] < 2.15)
  expect_true(hyperEM_ests$estimates[4] > 1.85)
  expect_true(hyperEM_ests$estimates[4] < 2.00)
  expect_true(hyperEM_ests$estimates[5] > .04)
  expect_true(hyperEM_ests$estimates[5] < .08)
  expect_true(!any(is.na(hyperEM_ests$estimates)))
  expect_true(hyperEM_ests$maximum < -4160)
  expect_true(hyperEM_ests$maximum > -4170)
  expect_true(hyperEM_ests$score_norm < .075)
  expect_true(!any(is.na(hyperEM_ests$score_norm)))
})
