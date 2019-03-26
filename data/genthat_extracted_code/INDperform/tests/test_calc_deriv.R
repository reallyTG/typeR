context("test calc_deriv")

# Test output format
a <- ind_init_ex[c(1, 9), ]
b <- merge_models_ex[c(1, 9), ]
dat <- calc_deriv(a, b, n_boot = 40)

test_that("output tibble", {
  expect_s3_class(dat, "tbl_df")
  # test columns
  expect_equal(ncol(dat), 29)
  expect_true(all(names(b) %in% names(dat)))
  # test rows
  expect_true(all(b$id %in% dat$id))
  # test generated data
  expect_is(dat$prop, "numeric")
  expect_true((dat$prop[[1]] <= 1 & dat$prop[[1]] >=
    0) | is.na(dat$prop[[1]]))
  expect_is(dat$zero_in_conf, "list")
  expect_is(dat$zero_in_conf[[2]], "logical")
})

dat2 <- calc_deriv(a, b, n_boot = 40, method = "cond_boot")
dat3 <- calc_deriv(a, b, n_boot = 40, method = "approx_deriv")

test_that("test method", {
  expect_true(all(c("pred_ci_low", "pred_ci_up") %in%
    names(dat)))
  expect_true(all(c("pred_ci_low", "pred_ci_up") %in%
    names(dat2)))
  expect_true(all(c("pred_ci_low", "pred_ci_up") %in%
    names(dat3)) == FALSE)
})


# Test dealing with different distributions
x <- c(1, 2, 5, 3, 4, 6, 7, 8, 14, 9, 11, 13, 15, 18,
  12, 16, 17, 10, 20, 19)
y_bin <- c(rep(0, 10), rep(1, 10))
set.seed(1)
y_pois <- rpois(20, lambda = 2)
y_pois <- sort(y_pois)

test_init <- ind_init(data.frame(y_bin = y_bin, y_pois = y_pois),
  x, time = 1970:1989)

test_mod1 <- model_gam(test_init[1, ], family = binomial())
test_mod2 <- model_gam(test_init[2, ], family = poisson())
test_mod3 <- model_gam(test_init[2, ], family = quasipoisson())
test_mod4 <- model_gam(test_init[2, ], family = mgcv::negbin(theta = 10))
# mgcv::nb() works only for gam()!!!!
test_mod5 <- model_gam(test_init[2, ], family = mgcv::nb())
# make edf non-linear to pass filter
test_mod1$edf <- 1.6
test_mod2$edf <- 1.6
# test_mod3$edf <- 1.6 # already > 1.6
test_mod4$edf <- 1.6
test_mod5$edf <- 1.6

test1 <- calc_deriv(test_init[1, ], test_mod1, n_boot = 40)
test2 <- calc_deriv(test_init[2, ], test_mod2, n_boot = 40)
test3 <- calc_deriv(test_init[2, ], test_mod3, n_boot = 40)
test4 <- calc_deriv(test_init[2, ], test_mod4, n_boot = 40)
test5 <- calc_deriv(test_init[2, ], test_mod5, n_boot = 40)

errors1 <- sum(purrr::map_lgl(1:40, ~is.null(test1$boot_error[[1]][.])))
errors2 <- sum(purrr::map_lgl(1:40, ~is.null(test2$boot_error[[1]][.])))
errors3 <- sum(purrr::map_lgl(1:40, ~is.null(test3$boot_error[[1]][.])))
errors4 <- sum(purrr::map_lgl(1:40, ~is.null(test4$boot_error[[1]][.])))
errors5 <- sum(purrr::map_lgl(1:40, ~is.null(test5$boot_error[[1]][.])))

test_that("check gams under different distributions", {
    expect_equal(test1$adj_n_boot, 40)
    expect_equal(test2$adj_n_boot, 40)
    expect_equal(test3$adj_n_boot, 40)
    expect_equal(test4$adj_n_boot, 40)
    expect_equal(test5$adj_n_boot, 40)
    expect_equal(round(test1$prop, 1), 0.2)
    expect_equal(round(test2$prop, 1), 0.7)
    expect_equal(round(test3$prop, 1), 0.7)
    expect_equal(round(test4$prop, 1), 0.7)
    expect_equal(round(test5$prop, 1), 0.8)
    expect_equal(errors1, 0)
    expect_equal(errors2, 0)
    expect_equal(errors3, 0)
    expect_equal(errors4, 0)
    expect_equal(errors5, 0)
})

# --- the same now with GAMMs - but only on own machine!!
# (takes too long!):
my_machine <- FALSE
if (my_machine) {
		test_mod1 <- model_gamm(test_init[1, ], family = binomial())
		test_mod1 <- test_mod1[2, ]
		test_mod2 <- model_gamm(test_init[2, ], family = poisson())
		test_mod2 <- test_mod2[2, ]
		# for
		test_mod3 <- model_gamm(test_init[2, ], family = mgcv::negbin(theta = 1000))
		test_mod3 <- test_mod4[1, ]

		# make edf non-linear to pass filter
		test_mod1$edf <- 1.6
		test_mod2$edf <- 1.6
		test_mod3$edf <- 1.6

		test1 <- calc_deriv(test_init[1, ], test_mod1, sign_level = 0.9,
		  n_boot = 40)
		test2 <- calc_deriv(test_init[2, ], test_mod2, sign_level = 0.9,
		  n_boot = 40)
		test3 <- calc_deriv(test_init[2, ], test_mod3, sign_level = 0.9,
		  n_boot = 40)

		errors1 <- sum(purrr::map_lgl(1:40, ~is.null(test1$boot_error[[1]][.])))
		errors2 <- sum(purrr::map_lgl(1:40, ~is.null(test2$boot_error[[1]][.])))
		errors3 <- sum(purrr::map_lgl(1:40, ~is.null(test3$boot_error[[1]][.])))

		test_that("check gamms under different distributions", {
		    expect_equal(test1$adj_n_boot, 40)
		    expect_equal(test2$adj_n_boot, 40)
		    expect_equal(test3$adj_n_boot, 40)
		    expect_equal(round(test1$prop, 1), 0)
		    expect_equal(round(test2$prop, 1), 0)
		    expect_equal(round(test3$prop, 1), 0.8)
		    expect_equal(errors1, 0)
		    expect_equal(errors2, 0)
		    expect_equal(errors3, 0)
		  })
}


# Test error and warning messages
# (quick test as it does not run the full function)

a <- ind_init_ex[c(1, 9, 48), ]
b <- merge_models_ex[c(1, 9, 48), ]
b2 <- b
b2$model[[2]] <- NA
b3 <- b
b3$edf <- as.character(b3$edf)

test_that("test warnings and errors for DIV routines", {
    expect_error(calc_deriv(mod_tbl = b), "Argument init_tbl is missing")
    expect_error(calc_deriv(init_tbl = a), "Argument mod_tbl is missing")
    expect_error(calc_deriv(a[-1, ], b))
    expect_error(calc_deriv(a, b, ci_boot = 1.5))
    expect_error(calc_deriv(a, b, ci_boot = NULL))
    expect_error(calc_deriv(a, b, edf_filter = NULL))
    expect_error(calc_deriv(a, b, edf_filter = 1))
    expect_error(calc_deriv(a, b, sign_level = 1.5))
    expect_error(calc_deriv(a, b, sign_level = NULL))
    expect_error(calc_deriv(a, b, edf_filter = 1))
    expect_error(calc_deriv(a, b, method = "conditional_boot"))
    expect_error(calc_deriv(a, b, par_comp = TRUE,
      no_cores = -1))
    expect_error(calc_deriv(a, b, method = "cond_boot",
      par_comp = 1))
    expect_error(calc_deriv(a, b, method = "cond_boot",
      par_comp = "yes"))
    expect_error(calc_deriv(a, b, seed = "sometext"))
    expect_error(calc_deriv(a, b[, -16], excl_outlier = TRUE))
    expect_message(calc_deriv(a, b, edf_filter = 10))
    # check of input tibbles
    expect_error(calc_deriv(a[, -(1:3)], b))  # init_tbl missing variables
    expect_error(calc_deriv(a, b[, -(1:3)]))  # mod_tbl missing variables
    expect_error(calc_deriv(a, b3))  # wrong data type in required variable

    # that should not return an error (all required
    # variables in mod_tbl), just a message that no edf
    # > edf_filter
    expect_message(calc_deriv(ind_init_ex[1, ],
      b[1, c("id", "ind", "press", "corrstruc",
        "edf", "p_val", "excl_outlier", "model")]))
  })


# Testing filtering by edf and sign_level and not
# including NAs

a <- ind_init_ex[c(1, 9), ]
b <- merge_models_ex[c(1, 9), ]
b1 <- b
b2 <- b
b1$edf <- c(NA_real_, NA_real_)
b2$p_val[2] <- NA_real_

test_that("test filtering and NAs", {
  expect_message(calc_deriv(a, b1), "contains no significant model")
  expect_message(calc_deriv(a, b2), "contains no significant model")
})


#### Test message for fitting failure (wrong family so adj_n_boot = NA) ###
# (test takes too long as it loops over every bootstrap
# to get the n_boot full --> only on own development machine)

my_machine <- FALSE
if (my_machine) {
		x <- c(1, 2, 5, 3, 4, 6, 7, 8, 14, 9, 11, 13, 15, 18,
			12, 16, 17, 10, 20, 19)
		y_bin <- c(rep(0, 10), rep(1, 10))
		test_init <- ind_init(data.frame(y_bin = y_bin),
			x, time = 1970:1989)
		test_mod1 <- model_gam(test_init, family = binomial())
		test_mod1$model[[1]]$family$family <- "poisson"

		test_that("check message", {
			expect_message(calc_deriv(test_init, test_mod1,
				n_boot = 40, excl_outlier = FALSE, edf_filter = 1.0001,
			 sign_level = 0.9, seed = 1))
		})
}
