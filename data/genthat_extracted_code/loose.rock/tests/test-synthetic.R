context("synthetic")

test_that("Covariance matrix is respected", {
  for(ix in 1:10) {
    n.vars <- ceiling(runif(1, min = 10, max = 99))
    diagonal.of.ones <-diag(cov(gen.synth.xdata(n.obs = 100, n.vars = n.vars, rho = runif(1))))
    expect_equal(diagonal.of.ones, rep(1, n.vars))
  }
})

test_that("Covariance matrix is not respected due to more variables than observations", {
  for(n.vars in 1:10) {
    n.obs <- ceiling(runif(1, min = 10, max = 99))
    expect_warning(xdata <- gen.synth.xdata(n.obs = n.obs, n.vars = 100, rho = runif(1)))
    #
    diagonal.of.ones <-diag(cov(xdata))
    expect_failure(expect_equal(diagonal.of.ones, rep(1, n.vars)))
  }
})

test_that('Covariance parameter is respected', {
  cov.param <- .2
  xdata1 <- gen.synth.xdata(10, 5, cov.param)
  xdata1.cov <- cov(xdata1)
  expect_true(all(sapply(1:ncol(xdata1), function(ix) {
    result <- TRUE
    if (ix > 1) {
      result <- result && (abs(xdata1.cov[ix,ix-1] - cov.param) < 1e-14)
    }
    if (ix < ncol(xdata1)) {
      result <- result && (abs(xdata1.cov[ix+1,ix] - cov.param) < 1e-14)
    }
    return(result)
  })))
})

test_that("Draw covariance", {
  xdata1 <- gen.synth.xdata(10, 5, .2)
  data.frame(cov(xdata1))
  expect_silent(draw.cov.matrix(xdata1) + ggplot2::ggtitle('X1 Covariance Matrix'))
})
