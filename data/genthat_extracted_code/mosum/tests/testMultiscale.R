N_TEST <- 5 # replications of tests with random input data

test_that("Single-bandwidth multiscale MOSUM without penalty equals MOSUM (symmetric)", {
  sbic_strength <- -Inf # Note
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
      G <- floor(runif(1, 5, 40))
      cpts.mosum.eta <- mosum(x, G, alpha=alpha, criterion="eta", eta=eta)$cpts
      cpts.multi.eta.pval <- multiscale.localPrune(x, G, rule="pval", alpha=alpha,
                                             criterion="eta", eta=eta,
                                             pen.exp=sbic_strength)$cpts
      cpts.multi.eta.peak <- multiscale.localPrune(x, G, rule='jump', alpha=alpha,
                                             criterion="eta", eta=eta,
                                             pen.exp=sbic_strength)$cpts
      expect_equal(cpts.multi.eta.pval, cpts.mosum.eta)
      expect_equal(cpts.multi.eta.peak, cpts.mosum.eta)
      
      cpts.mosum.eps <- mosum(x, G, alpha=alpha, criterion="epsilon", epsilon=epsilon)$cpts
      cpts.multi.eps.pval <- multiscale.localPrune(x, G, rule="pval", alpha=alpha,
                                             criterion="epsilon", epsilon=epsilon,
                                             pen.exp=sbic_strength)$cpts
      cpts.multi.eps.peak <- multiscale.localPrune(x, G, rule='jump', alpha=alpha,
                                             criterion="epsilon", epsilon=epsilon,
                                             pen.exp=sbic_strength)$cpts
      expect_equal(cpts.multi.eps.pval, cpts.mosum.eps)
      expect_equal(cpts.multi.eps.peak, cpts.mosum.eps)
    }
  }
})

# test_that("Single-bandwidth multiscale MOSUM without penalty equals MOSUM (asymmetric)", {
#   sbic_strength <- -Inf # Note
#   for (i in 1:N_TEST) {
#     alpha <- runif(1, 0, 1)
#     eta <- runif(1, 0, 1)
#     epsilon <- runif(1, 0, 1)
#     ts <- list(testData(model="blocks"),
#                testData(model="fms"),
#                testData(model="mix"),
#                testData(model="stairs10"),
#                testData(model="teeth10"))
#     for (x in ts) {
#       G_left <- floor(runif(1, 5, 40))
#       G_right <- floor(runif(1, 5, 40))
#       H <- multiscale.grid(G_left, G_right, max.unbalance=Inf)
#       cpts.mosum.eta <- mosum(x, G_left,
#                                          G.right=G_right, alpha=alpha,
#                                    criterion="eta",
#                                    eta=eta)$cpts
#       cpts.multi.eta.pval <- multiscale.localPrune(x, H, rule="pval", alpha=alpha,
#                                              criterion="eta", eta=eta,
#                                              pen.exp=sbic_strength)$cpts
#       cpts.multi.eta.peak <- multiscale.localPrune(x, H, rule='jump', alpha=alpha,
#                                              criterion="eta", eta=eta,
#                                              pen.exp=sbic_strength)$cpts
#       expect_equal(cpts.multi.eta.pval, cpts.mosum.eta)
#       expect_equal(cpts.multi.eta.peak, cpts.mosum.eta)
#       cpts.mosum.eps <- mosum(x, G_left,
#                                          G.right=G_right, alpha=alpha,
#                                    criterion="epsilon",
#                                    epsilon=epsilon)$cpts
#       cpts.multi.eps.pval <- multiscale.localPrune(x, H, rule="pval", alpha=alpha,
#                                              criterion="epsilon", epsilon=epsilon,
#                                              pen.exp=sbic_strength)$cpts
#       cpts.multi.eps.peak <- multiscale.localPrune(x, H, rule='jump', alpha=alpha,
#                                              criterion="epsilon", epsilon=epsilon,
#                                              pen.exp=sbic_strength)$cpts
#       expect_equal(cpts.multi.eps.pval, cpts.mosum.eps)
#       expect_equal(cpts.multi.eps.peak, cpts.mosum.eps)
#     }
#   }
# })

test_that("Multiscale merging with infinite penalty yields empty set", {
  sbic_strength <- Inf # Note
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
      G <- floor(runif(1, 5, 40))
      cpts.multi.eta.pval <- multiscale.localPrune(x, G, rule="pval", alpha=alpha,
                                             criterion="eta", eta=eta,
                                             pen.exp=sbic_strength)$cpts
      cpts.multi.eta.peak <- multiscale.localPrune(x, G, rule='jump', alpha=alpha,
                                             criterion="eta", eta=eta,
                                             pen.exp=sbic_strength)$cpts
      expect_length(cpts.multi.eta.pval, 0)
      expect_length(cpts.multi.eta.peak, 0)
      cpts.multi.eps.pval <- multiscale.localPrune(x, G, rule="pval", alpha=alpha,
                                             criterion="epsilon", epsilon=epsilon,
                                             pen.exp=sbic_strength)$cpts
      cpts.multi.eps.peak <- multiscale.localPrune(x, G, rule='jump', alpha=alpha,
                                             criterion="epsilon", epsilon=epsilon,
                                             pen.exp=sbic_strength)$cpts
      expect_length(cpts.multi.eps.pval, 0)
      expect_length(cpts.multi.eps.peak, 0)
    }
  }
})

test_that("Increased penaly does not increase number of cpts", {
  sbic_strengths <- c(-Inf, 0, 1, 1.1, 1.5, 10, Inf)
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
      G <- floor(runif(1, 5, 40))
      cpts.multi.eta.pval <- cpts.multi.eta.peak <-
        cpts.multi.eps.pval <- cpts.multi.eps.peak <- list()
      for (j in 1:length(sbic_strengths)) {
        sbic_strength <- sbic_strengths[j]
        cpts.multi.eta.pval[[j]] <- multiscale.localPrune(x, G, rule="pval", alpha=alpha,
                                               criterion="eta", eta=eta,
                                               pen.exp=sbic_strength)$cpts
        cpts.multi.eta.peak[[j]] <- multiscale.localPrune(x, G, rule='jump', alpha=alpha,
                                               criterion="eta", eta=eta,
                                               pen.exp=sbic_strength)$cpts
        cpts.multi.eps.pval[[j]] <- multiscale.localPrune(x, G, rule="pval", alpha=alpha,
                                               criterion="epsilon", epsilon=epsilon,
                                               pen.exp=sbic_strength)$cpts
        cpts.multi.eps.peak[[j]] <- multiscale.localPrune(x, G, rule='jump', alpha=alpha,
                                               criterion="epsilon", epsilon=epsilon,
                                               pen.exp=sbic_strength)$cpts
        if (j > 1) {
          expect_lte(length(cpts.multi.eta.pval[[j]]),
                     length(cpts.multi.eta.pval[[j-1]]))
          expect_lte(length(cpts.multi.eta.peak[[j]]),
                     length(cpts.multi.eta.peak[[j-1]]))
          expect_lte(length(cpts.multi.eps.pval[[j]]),
                     length(cpts.multi.eps.pval[[j-1]]))
          expect_lte(length(cpts.multi.eps.peak[[j]]),
                     length(cpts.multi.eps.peak[[j-1]]))
        }
      }
    }
  }
})