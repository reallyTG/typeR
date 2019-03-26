context("plot and summary")

# Set a tolerance for the comparison of the simulated values

my_tol <- 1e-5
seed <- 27082017
n <- 1000

# 1. Check that the output from summary.ithresh is a double matrix and has the
#    correct dimensions.

set.seed(seed)
n_v <- 4
u_vec_gom <- quantile(gom, probs = seq(0, 0.9, len = n_v))
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom, n_v = n_v, n = n)
check_summary <- summary(gom_cv)

test_that("summary.ithresh: double", {
  testthat::expect_type(check_summary, "double")
})
test_that("summary.ithresh: matrix", {
  testthat::expect_is(check_summary, "matrix")
})
test_that("summary.ithresh: n_v-row matrix", {
  testthat::expect_equal(nrow(check_summary), n_v)
})
test_that("summary.ithresh: 5-col matrix", {
  testthat::expect_equal(ncol(check_summary), 5)
})

# 2. Check that the columns of the object returned by plot.ithresh (when
#    which_u is not supplied) sum to 1 if na.rm = TRUE and c(NA, ..., NA, 1)
#    if na.rm = FALSE.

check_plot <- plot(gom_cv)

test_that("plot.ithresh: columns sum to 1", {
  testthat::expect_equal(colSums(check_plot$y, na.rm = TRUE), rep(1, n_v),
                         tolerance = my_tol)
})
test_that("plot.ithresh: columns sum to 1, or NA if v < max(u_vec)", {
  testthat::expect_equal(colSums(check_plot$y), c(rep(NA, n_v - 1), 1),
                         tolerance = my_tol)
})

# 3. Check that when which_u is supplied the dimensions of the objects containing
#    the simulated values are correct.

check_plot <- plot(gom_cv, which_u = "best")
test_that("plot.ithresh, best: sim_vals has dim n by 2", {
  testthat::expect_equal(dim(check_plot$sim_vals), c(n, 2),
                         tolerance = my_tol)
})
test_that("plot.ithresh, best: bin_sim_vals has dim n by 1", {
  testthat::expect_equal(dim(check_plot$bin_sim_vals), c(n, 1),
                         tolerance = my_tol)
})

check_plot <- plot(gom_cv, which_u = 1)
test_that("plot.ithresh, 1: sim_vals has dim n by 2", {
  testthat::expect_equal(dim(check_plot$sim_vals), c(n, 2),
                         tolerance = my_tol)
})
test_that("plot.ithresh, 1: bin_sim_vals has dimensions n by 1", {
  testthat::expect_equal(dim(check_plot$bin_sim_vals), c(n, 1),
                         tolerance = my_tol)
})

# 4. Check that key graphical parameters that the user may supply to
#    plot.stability() to be passed to matplot are used.

u_vec_gom <- quantile(gom, probs = seq(0, 0.9, by = 0.05))
gom_stab <- stability(data = gom, u_vec = u_vec_gom)

my_pch <- 1
my_lwd <- 2
my_xlab <- "horizontal"
my_ylab <- "vertical"
my_col <- 2
check_pars <- plot(gom_stab, pch = my_pch, lwd = my_lwd, xlab = my_xlab,
                   ylab = my_ylab, col = my_col, top_scale = "opposite")
test_that("plot.stability: correct pch", {
  testthat::expect_equal(check_pars$matplot_args$pch, my_pch,
                         tolerance = my_tol)
})
test_that("plot.stability: correct lwd", {
  testthat::expect_equal(check_pars$matplot_args$lwd, my_lwd,
                         tolerance = my_tol)
})
test_that("plot.stability: correct xlab", {
  testthat::expect_equal(check_pars$matplot_args$xlab, my_xlab,
                         tolerance = my_tol)
})
test_that("plot.stability: correct ylab", {
  testthat::expect_equal(check_pars$matplot_args$ylab, my_ylab,
                         tolerance = my_tol)
})
test_that("plot.stability: correct col", {
  testthat::expect_equal(check_pars$matplot_args$col, my_col,
                         tolerance = my_tol)
})

# 5. Check that key graphical parameters that the user may supply to
#    plot.ithreshpred() to be passed to matplot are used.

u_vec_gom <- quantile(gom, probs = seq(0, 0.9, by = 0.3))
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom, n_v = 2)

my_pch <- 1
my_lwd <- 2
my_xlab <- "horizontal"
my_ylab <- "vertical"
my_col <- 2

# (a) which_all = "best" (default)

best_p <- predict(gom_cv, n_years = c(100, 1000))
check_pars <- plot(best_p, pch = my_pch, lwd = my_lwd, xlab = my_xlab,
                   ylab = my_ylab, col = my_col)
test_that("plot.ithreshpred: correct pch", {
  testthat::expect_equal(check_pars$pch, my_pch,
                         tolerance = my_tol)
})
test_that("plot.ithreshpred: correct lwd", {
  testthat::expect_equal(check_pars$lwd, my_lwd,
                         tolerance = my_tol)
})
test_that("plot.ithreshpred: correct xlab", {
  testthat::expect_equal(check_pars$xlab, my_xlab,
                         tolerance = my_tol)
})
test_that("plot.ithreshpred: correct ylab", {
  testthat::expect_equal(check_pars$ylab, my_ylab,
                         tolerance = my_tol)
})
test_that("plot.ithreshpred: correct col", {
  testthat::expect_equal(check_pars$col, my_col,
                         tolerance = my_tol)
})

# (b) which_all = "all" (default)

all_p <- predict(gom_cv, which_u = "all")
n_col_y <- ncol(all_p$y)
check_pars <- plot(all_p, pch = my_pch, lwd = my_lwd, xlab = my_xlab,
                   ylab = my_ylab, col = my_col, add_best = TRUE)
test_that("plot.ithreshpred: correct pch", {
  testthat::expect_equal(check_pars$pch, my_pch,
                         tolerance = my_tol)
})
test_that("plot.ithreshpred: correct lwd", {
  testthat::expect_equal(check_pars$lwd, rep(my_lwd, n_col_y),
                         tolerance = my_tol)
})
test_that("plot.ithreshpred: correct xlab", {
  testthat::expect_equal(check_pars$xlab, my_xlab,
                         tolerance = my_tol)
})
test_that("plot.ithreshpred: correct ylab", {
  testthat::expect_equal(check_pars$ylab, my_ylab,
                         tolerance = my_tol)
})
test_that("plot.ithreshpred: correct col", {
  testthat::expect_equal(check_pars$col, rep(my_col, n_col_y),
                         tolerance = my_tol)
})

