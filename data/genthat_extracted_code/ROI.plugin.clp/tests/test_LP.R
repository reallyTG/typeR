context("simple LP problem")

## Simple linear program.
## maximize:   2 x_1 + 4 x_2 + 3 x_3
## subject to: 3 x_1 + 4 x_2 + 2 x_3 <= 60
##             2 x_1 +   x_2 + 2 x_3 <= 40
##               x_1 + 3 x_2 + 2 x_3 <= 80
##               x_1, x_2, x_3 are non-negative real numbers


testthat::test_that("find solution", {
  LP <- ROI::OP(c(2, 4, 3),
                ROI::L_constraint(L = matrix(c(3, 2, 1, 4, 1, 3, 2, 2, 2), nrow = 3),
                                  dir = c("<=", "<=", "<="),
                                  rhs = c(60, 40, 80)), bounds = NULL,
                max = TRUE)
  
  res_lp <- ROI::ROI_solve(x = LP, solver = "clp", control = list(amount = 4))
  
  testthat::expect_equal(round(res_lp$solution, 2), c(0.00, 6.67, 16.67))
})

testthat::test_that("with bounds", {
  LP <- ROI::OP(c(2, 4, 3),
                ROI::L_constraint(L = matrix(c(3, 2, 1, 4, 1, 3, 2, 2, 2), nrow = 3),
                                  dir = c("<=", "<=", "<="),
                                  rhs = c(60, 40, 80)), 
                bounds = ROI::V_bound(ui=3, ub=15, li = 1, lb = 2),
                max = TRUE)
  
  res_lp <- ROI::ROI_solve(x = LP, solver = "clp", control = list(amount = 0))
  
  testthat::expect_equal(res_lp$solution, c(2, 6, 15))
})

testthat::test_that("identical results", {
  LP <- ROI::OP(c(2, 4, 3),
                ROI::L_constraint(L = matrix(c(3, 2, 1, 4, 1, 3, 2, 2, 2), nrow = 3),
                                  dir = c("<=", "<=", "<="),
                                  rhs = c(60, 40, 80)), 
                bounds = ROI::V_bound(ui=3, ub=15, li = 1, lb = 2),
                max = TRUE)
  
  res_1 <- ROI::ROI_solve(x = LP, solver = "clp", control = list(amount = 0))
  res_2 <- ROI::ROI_solve(x = LP, solver = "clp", control = list(verbosity_level = 0))
  res_3 <- ROI::ROI_solve(x = LP, solver = "clp", amount = 0L)
  res_4 <- ROI::ROI_solve(x = LP, solver = "clp", verbosity_level = 0L)
  
  testthat::expect_equal(res_1, res_2)
  testthat::expect_equal(res_2, res_3)
  testthat::expect_equal(res_3, res_4)
})