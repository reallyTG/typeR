context("LUCIDus Testing")

test_that("Test for est_lucid", {
  set.seed(10)
  IntClusFit <- est_lucid(G=G1,Z=Z1,Y=Y1,K=2,family="binary",Pred=TRUE,
                          tunepar = def_tune(Select_G=TRUE,Select_Z=TRUE,
                                             Rho_G=0.01,Rho_Z_InvCov=0.06,Rho_Z_CovMu=90))

  beta0 <- 5
  beta1 <- abs(IntClusFit$mu[2,1])
  expect_length(IntClusFit, 15)
  expect_equal(beta0, beta1, tolerance = 0.05)
})
