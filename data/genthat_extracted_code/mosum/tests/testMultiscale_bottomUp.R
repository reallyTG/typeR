N_TEST <- 5 # replications of tests with random input data

test_that("Single-bandwidth Multiscale CPTS bottom up equals MOSUM", {
  for (i in 1:N_TEST) {
    alpha <- runif(1, 0, 1)
    eta <- runif(1, 0, 1)
    epsilon <- runif(1, 0, 1)
    ts <- list(testData(model="blocks"),
               testData(model="fms"),
               testData(model="mix"),
               testData(model="stairs10"),
               testData(model="teeth10"))
    for (x in ts) {
      n <- length(x)
      G <- max(floor(runif(1, 20, 40)), ceiling(runif(1, 0.05*n, 0.2*n)))
      cpts.mosum <- mosum(x, G, alpha=alpha, criterion="eta",
                               eta=eta)$cpts
      cpts.moba <- multiscale.bottomUp(x, G=G, eta=eta,
                                            alpha=alpha)$cpts
      names(cpts.moba) <- NULL
      cpts.moba <- as.numeric(cpts.moba)
      expect_equal(cpts.moba, cpts.mosum)
    }
  }
})