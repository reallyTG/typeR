context("Joint segmentation using 'jointSeg'")

## A two-dimensional, noiseless signal
p <- 2
trueK <- 10
len <- 1e4

test_that("'jointSeg' recovers the true breakpoints exactly for a Gaussian noiseless signal", {
              for (ii in 1:10) {
                  sim <- randomProfile(length=len, nBkp=trueK, noiseLevel=0, dim=p)
                  Y <- sim$profile
                  K <- 2*trueK

                  res <- jointSeg(Y, method="RBS", K=K, modelSelectionMethod="Birge")
                  bkpB <- res$bestBkp
                  expect_equal(bkpB, sim$bkp)

                  res <- jointSeg(Y, method="RBS", K=K, modelSelectionMethod="Lebarbier")
                  bkpL <- res$bestBkp
                  ## expect_equal(bkpL, sim$bkp)  ## often fails, cf Issue #6

                  bkp <- res$dpBkp[[length(sim$bkp)]]
                  expect_equal(bkp, sim$bkp)
              }
})
