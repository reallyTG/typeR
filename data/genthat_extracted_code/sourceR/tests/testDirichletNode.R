context("Test Dirichlet Node and update")

test_that("AdaptiveLogDirMRW", {
  X <- c(40, 10, 24, 1, 1, 5)
  z <- c(2, 2, 4, 0, 0, 0)
  prior <- DataNode$new(data = 1 + X,
                        'prior')
  r <- X / sum(X)
  rNode <- DirichletNode$new(data = r,
                             alpha = prior,
                             name = 'r')

  a <- DataNode$new(data = 0.1, name = 'a')
  b <- DataNode$new(data = 0.1, name = 'b')
  beta <- GammaNode$new(
    data = 7.25,
    shape = a,
    rate = b,
    name = 'beta'
  )

  y <- PoissonNode$new(
    data = z,
    lambda = beta,
    offset = rNode,
    name = 'y'
  )

  # MCMC
  iter <- 2000
  posterior <- matrix(ncol = length(r), nrow = 2000)
  posterior[1, ] <- rNode$getData()
  rUpd <- AdaptiveLogDirMRW$new(
    node = rNode,
    toupdate = function()
      sample(length(r), 3),
    tune = rep(1.0, length(X))
  )

  for (i in 2:2000) {
    rUpd$update()
    posterior[i, ] <- rNode$getData()
  }
  means <- apply(posterior[500:2000,], 2, mean)
  vars <- apply(posterior[500:2000,], 2, var)
  expect_equal(means, c(0.45, 0.13, 0.31,
               0.02, 0.02, 0.06), tolerance=0.02)
  expect_equal(vars, c(0.0031, 0.0017,
               0.0027, 0.00015, 0.0002,
               0.00071), tolerance=1e-3)
})
