context("simplex")

test_that("simplex use", {
  skip_on_cran()
  cat("test simplex use\n")
  a <- 3
  xvals <- 1:10
  yvals <- a * xvals + rnorm(10)
  
  evalfunc <- function(x) {
    sim_y <- xvals * x
    diff <- yvals - sim_y
    ll <- sum(dnorm(diff, mean = 0, sd = 1, log =TRUE))
    return(-ll)
  }
  
  v <- simplex(initpars=c(2), evalfunc, 
               verbose = FALSE,
               maxiter = 1000)
  v <- simplex(initpars=c(2), evalfunc, 
               verbose = TRUE,
               maxiter = 10)
})