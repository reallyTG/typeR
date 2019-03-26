context("test cond_boot")


# Test helper functions ---------------------------


# check_n_boot
new_n_boot <- check_n_boot(n_boot = 50, ci = 1.5)

test_that("test check_n_boot", {
  expect_false(new_n_boot == 50)
  expect_message(check_n_boot(n_boot = 50, ci = 1.5))
  expect_failure((expect_message(check_n_boot(n_boot = 40,
    ci = 1.5))))
})

# mod_y_boot
x <- seq(-5, 5, 0.5)
test1 <- mod_y_boot(x, family = "poisson")
test2 <- mod_y_boot(x, family = "quasipoisson")
test3 <- mod_y_boot(x, family = "nb")
test4 <- mod_y_boot(x, family = "binomial")
test5 <- mod_y_boot(x, family = "Gamma")
test6 <- mod_y_boot(x, family = "gaussian")


test_that("test mod_y_boot", {
  expect_true(is.integer(test1))
  expect_true(is.integer(test2))
  expect_true(is.integer(test3))
  expect_equal(sum(test1), 30)
  expect_equal(sum(test2), 30)
  expect_equal(sum(test3), 30)
  expect_equal(sum(test4), 10)
  expect_true(is.integer(test5) == FALSE)
  expect_true(is.integer(test6) == FALSE)
  expect_equal(test5, x)
  expect_equal(test6, x)
})

# adj_n_boot
test_that("test adj_n_boot", {
  expect_true(is.na(adj_n_boot(10)))
  expect_true(is.na(adj_n_boot(NA)))
  expect_true(is.na(adj_n_boot(39)))
  expect_equal(adj_n_boot(40), 40)
  expect_equal(adj_n_boot(65), 40)
  expect_equal(adj_n_boot(100), 80)
  expect_equal(adj_n_boot(200), 200)
  expect_equal(adj_n_boot(2100), 2080)
})

# sample_boot
x = 1:10
y = 10:1
m1 <- mgcv::gam(y ~ s(x))
a <- tibble::tibble(id = 1:6, boot_fit = list(m1, m1,
  m1, m1, m1, m1))
set.seed(1)
test1 <- sample_boot(a, 1)
test2 <- sample_boot(a, 3)
test3 <- sample_boot(a, 6)

test_that("test sample_boot", {
  expect_true(is.logical(test1$considered))
  expect_equal(sum(test1$considered), 1)
  expect_equal(sum(test2$considered), 3)
  expect_equal(sum(test3$considered), 6)
  expect_true(test1$considered[2])
  expect_true(all(test2$considered[c(3, 4, 6)]))
  expect_true(all(test3$considered))
})

# calc_value
test_list <- list(ind_init_ex)
set.seed(1)
a <- tibble::tibble(id = 1:3, test_list = list(x1 = rnorm(20),
  x2 = rnorm(20), x3 = rnorm(20)), considered = rep(TRUE,
  3)) %>% list()
test <- apply(cbind(a[[1]]$test_list[[1]], a[[1]]$test_list[[2]],
  a[[1]]$test_list[[3]]), 1, mean)

test_that("test calc_value", {
  expect_true(is.numeric(calc_value(a, "test_list",
    mean)))
  expect_true(length(calc_value(a, "test_list", mean)) ==
    length(a[[1]]$test_list[[1]]))
  expect_equal(calc_value(a, "test_list", mean),
    test)
})


# -------------------------------------------------


# Test actual cond_boot() function
id <- ind_init_ex$id[(ind_init_ex$ind == "TZA" & ind_init_ex$press ==
  "Fsprat") | (ind_init_ex$ind == "Stickle" & ind_init_ex$press ==
  "Ssum")]
a <- ind_init_ex[id, ]
b <- merge_models_ex[id, ]

dat <- cond_boot(init_tbl = a, mod_tbl = b, n_boot = 40,
  excl_outlier = FALSE, ci = 0.95, par_comp = FALSE,
  no_clust = NULL, seed = NULL)

test_that("output tibble", {
  expect_s3_class(dat, "tbl_df")
  # test columns
  expect_equal(ncol(dat), 26)
  expect_true(all(names(b) %in% names(dat)))
  expect_true(all(c("pred_ci_up", "pred_ci_low",
    "deriv1_ci_low", "deriv1_ci_up") %in% names(dat)))
  # test rows
  expect_true(all(b$id %in% dat$id))
  # test generated data
  expect_is(dat$press_seq, "list")
  expect_is(dat$pred, "list")
  expect_is(dat$deriv1, "list")
  expect_is(dat$press_seq[[1]], "numeric")
  expect_equal(length(dat$press_seq[[1]]), 27)
  expect_is(dat$deriv1[[1]], "numeric")
  expect_equal(length(dat$deriv1[[1]]), 27)
  expect_is(dat$deriv1_ci_low[[1]], "numeric")
  expect_is(dat$deriv1_ci_up[[1]], "numeric")
  expect_is(dat$boot_error[[1]], "list")
  expect_is(dat$adj_n_boot[[1]], "numeric")
  expect_equal(length(dat$adj_n_boot[[1]]), 1)
})

# Test whether the seed setting works for both
# serial and parallel computing
id <- ind_init_ex$id[(ind_init_ex$ind == "TZA" & ind_init_ex$press ==
  "Fsprat")]
a <- ind_init_ex[id, ]
b <- merge_models_ex[id, ]

ser1 <- cond_boot(a, b, n_boot = 40, ci = 0.95, excl_outlier = FALSE,
  par_comp = FALSE, no_clust = NULL, seed = 1)
ser2 <- cond_boot(a, b, n_boot = 40, ci = 0.95, excl_outlier = FALSE,
  par_comp = FALSE, no_clust = NULL, seed = 1)
# Works fine but not when checking the package with
# devtools: par1 <- cond_boot(a, b, n_boot = 40, ci
# = 0.95, excl_outlier = FALSE, par_comp = TRUE,
# no_clust = 2, seed = 1) par2 <- cond_boot(a, b,
# n_boot = 40, ci = 0.95, excl_outlier = FALSE,
# par_comp = TRUE, no_clust = NULL, seed = 1)

test_that("seed setting", {
  expect_equal(ser1$pred, ser2$pred)
  expect_equal(ser1$deriv1, ser2$deriv1)
  expect_equal(ser1$deriv1_ci_up, ser2$deriv1_ci_up)

  # expect_equal(par1$pred, par2$pred)
  # expect_equal(par1$deriv1, par2$deriv1)
  # expect_equal(par1$deriv1_ci_up,
  # par2$deriv1_ci_up)

  # expect_true(ser1$pred[[1]][1] !=
  # par1$pred[[1]][1])
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
			expect_message(cond_boot(test_init, test_mod1,
				n_boot = 40, ci = 0.95, excl_outlier = FALSE,
				par_comp = FALSE, no_clust = NULL, seed = 1))
		})
}
