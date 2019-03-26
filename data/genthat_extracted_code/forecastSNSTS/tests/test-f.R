context("f")

# In this file we test the f function

test_that("function f returns values from paper", {

  ## this just takes too long?
  skip_on_cran()
      
  n <- 100
  a <- list( function(u) {return(0.8+0.19*sin(4*pi*u))} )
  sigma <- function (u) {return(1)}
  
  Ns <- seq( floor((n/2)^(4/5)), floor(n^(4/5)), ceiling((floor(n^(4/5)) - floor((n/2)^(4/5)))/25) )
  which.deltas <- c(0, 0.01, 0.05, 0.1, 0.15, 0.2, 0.4, 0.6)
  P_max <- 7
  H <- 1
  m <- floor(n^(.85)/4)
  
  res1 <- f( which.deltas, P_max, h = 1, n, Ns, m, a, sigma )
  expRes1 <- c(0.000000e+00, 4.976379e-05, 1.955854e-05, 1.173058e-04, 4.847858e-02,
               9.983429e-02, 2.494558e-01, 2.182397e-02)

  res5 <- f( which.deltas, P_max, h = 5, n, Ns, m, a, sigma )
  expRes5 <- c(0.000000e+00, 4.449795e-05, 5.454015e-05, 2.393047e-04, 6.188790e-05,
               1.886483e-03, 2.918796e-03, 3.293354e-01)
  
  expect_equal(res1, expRes1, tolerance = 1e-5)
  expect_equal(res5, expRes5, tolerance = 1e-5)

})
