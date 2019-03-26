library(lg)
context("Density estimation functions")

test_matrix_2col   <- matrix(c(1, 2, 1, 2), ncol = 2)
test_matrix_3col   <- matrix(c(1, 2, 1, 2, 1, 2), ncol = 3)
test_df_2col       <- data.frame(x1 = c(1, 2), x2 = c(1, 2))
test_df_3col       <- data.frame(x1 = c(1, 2), x2 = c(1, 2), x3 = c(1, 2))
test_string        <- "teststring"
test_bw_ok         <- c(1, 1)
test_bw_length     <- c(1, 1, 1)
test_bw_nonnumeric <- c("a", "b")
test_bw_nonvector  <- function() {}
test_estmethod1    <- "1par"
test_estmethod2    <- "5par"
test_estmethod_wr  <- "4par"


test_that("dlg_bivariate gives proper errors", {
    expect_error(dlg_bivariate(test_string,
                               eval_points = test_matrix_2col,
                               bw = test_bw_ok,
                               est_method = test_estmethod1),
                 "The data must be a matrix or a data frame")
     expect_error(dlg_bivariate(test_matrix_2col,
                               eval_points = test_string,
                               bw = test_bw_ok,
                               est_method = test_estmethod1),
                 "The grid must be a matrix or a data frame")
    expect_error(dlg_bivariate(test_matrix_3col,
                               eval_points = test_matrix_2col,
                               bw = test_bw_ok,
                               est_method = test_estmethod1),
                 "The data can only have 2 variables")
    expect_error(dlg_bivariate(test_df_3col,
                               eval_points = test_df_2col,
                               bw = test_bw_ok,
                               est_method = test_estmethod1),
                 "The data can only have 2 variables")
    expect_error(dlg_bivariate(test_matrix_2col,
                               eval_points = test_matrix_3col,
                               bw = test_bw_ok,
                               est_method = test_estmethod1),
                 "The grid can only have 2 variables")
    expect_error(dlg_bivariate(test_df_2col,
                               eval_points = test_df_3col,
                               bw = test_bw_ok,
                               est_method = test_estmethod1),
                 "The grid can only have 2 variables")
    expect_error(dlg_bivariate(test_df_2col,
                               eval_points = test_df_3col,
                               bw = test_bw_ok,
                               est_method = test_estmethod1),
                 "The grid can only have 2 variables")
    expect_error(dlg_bivariate(test_df_2col,
                               eval_points = test_df_2col,
                               bw = test_bw_nonvector,
                               est_method = test_estmethod1),
                 "bw must be a vector")
    expect_error(dlg_bivariate(test_df_2col,
                               eval_points = test_df_2col,
                               bw = test_bw_length,
                               est_method = test_estmethod1),
                 "bw must have length 2")
    expect_error(dlg_bivariate(test_df_2col,
                               eval_points = test_df_2col,
                               bw = test_bw_nonnumeric,
                               est_method = test_estmethod1),
                 "bw must be numeric")
    expect_error(dlg_bivariate(test_df_2col,
                               eval_points = test_df_2col,
                               bw = test_bw_ok,
                               est_method = test_estmethod_wr),
                 "Estimation method must be either '1par', '5par' or '5par_marginals_fixed'")
})

test_that("dlg_bivariate returns the same grid for the two estimation methods", {
    expect_equal(dlg_bivariate(x = test_matrix_2col, grid_size = 15, est_method = "1par")$eval_points,
                 dlg_bivariate(x = test_matrix_2col, grid_size = 15, est_method = "5par")$eval_points)

})

x <- rnorm(100); eval_points <- -5:5; bw <- .5
est <- dlg_marginal(x = x, bw = bw, eval_points = eval_points)
test_that("dlg_marginal returns values", {
    expect_equal(x, est$x)
    expect_equal(eval_points, est$eval_points)
    expect_equal(bw, est$bw)
    expect_equal(dim(est$par_est), c(length(eval_points), 2))
})

data_matrix <- cbind(rnorm(100), rnorm(100))
eval_matrix <- cbind(c(1,2,3), c(2,3,4))
bw_vector<- c(1,2)
result <- dlg_marginal_wrapper(data_matrix, eval_matrix, bw_vector)
test_that("dlg_marginal_wrapper returns values", {
    expect_equal(is.list(result), TRUE)
    expect_equal(length(result), ncol(data_matrix))
})

set.seed(1)
n <- 100
x <- mvtnorm::rmvt(n, df = 10, sigma = diag(3))
grid <- cbind(c(1,2,3), c(1,2,3), c(1,2,3))

lg_object <- lg_main(x)
density_estimate <- dlg(lg_object, grid = grid)

lg_object_wrong <- grid
grid_wrong_dimension <- cbind(grid, c(1,2,3))

test_that("The main density estimator produces correct errors", {
    expect_error(dlg(lg_object_wrong, grid), "Object must be of class 'lg'")
    expect_error(dlg(lg_object, grid_wrong_dimension), "The grid can only have 3 variables")
})

condition       <- c(1, 0)
grid            <- matrix(seq(-5, 5, length.out = 100), ncol = 1)
grid_wrong      <- matrix(seq(-5, 5, length.out = 100), ncol = 2)
condition_wrong <- c(1)

test_that("The conditional density estimator produces correct errors", {
    expect_error(clg(lg_object, grid = grid_wrong, condition = condition), "The grid can only have 1 variables")
    expect_error(clg(lg_object, grid = grid, condition = condition_wrong), "The grid can only have 2 variables")
})











