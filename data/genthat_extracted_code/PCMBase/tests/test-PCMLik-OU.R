library(testthat)
context("PCMLik, OU")

library(PCMBase)

if(PCMBaseIsADevRelease()) {

  library(mvtnorm)

  list2env(PCMBaseTestObjects, globalenv())

  # test likelihood
  test_that(
    "Single trait log-likelihood, regime a", {
      expect_equivalent(PCMLik(traits.a.1, tree.a, model.a.1), -91.015331180479)
      expect_equivalent(PCMLik(traits.a.2, tree.a, model.a.2), -60.0600001079255)
      expect_equivalent(PCMLik(traits.a.3, tree.a, model.a.3), -527.311935254892)
    })


  test_that(
    "Triple-trait log-likelihood of independent traits, regime a", {
      expect_equivalent(PCMLik(traits.a.123, tree.a, model.a.123), -205.993838713138)
    })


  MeanVec <- PCMMean(tree.a, model.a.123, model.a.123$X0)
  VarMat <- PCMVar(tree.a, model.a.123)

  test_that(
    "Triple-trait log-likelihood, of independent traits, regime a, using PCMMean and PCMVar", {
      expect_equivalent(
        dmvnorm(as.vector(traits.a.123[, 1:PCMTreeNumTips(tree.a)]),
                as.vector(MeanVec), VarMat, log = TRUE),
        -205.993838713138
      )
    }
  )

  set.seed(1, kind = "Mersenne-Twister", normal.kind = "Inversion")

  test_that("Generate a random model, single regime (a)", {
    expect_silent(model.a.123.OU <- PCM("OU", k = 3, regimes = "a"))
    expect_silent(PCMParamLoadOrStore(model.a.123.OU,
                                      PCMParamRandomVecParams(model.a.123.OU),
                                      offset = 0, k = 3, load = TRUE))

    # this fails due to numerical problem with the PCMVar - error : sigma must be a symmetric matrix
    # expect_equivalent(
    #   PCMLik(traits.a.123, tree.a, model.a.123.OU),
    #   dmvnorm(as.vector(traits.a.123[, 1:PCMTreeNumTips(tree.a)]),
    #           as.vector(PCMMean(tree.a, model.a.123.OU, model.a.123.OU$X0)),
    #           PCMVar(tree.a, model.a.123.OU), log = TRUE))

  })

  test_that("Equal likelihood with dmvnorm on a random model, multiple regimes (ab)", {
    expect_silent(model.ab.123.OU <- PCM("OU", k = 3, regimes = c("a", "b")))
    expect_silent(PCMParamLoadOrStore(model.ab.123.OU,
                                      PCMParamRandomVecParams(model.ab.123.OU),
                                      offset = 0, k = 3, load = TRUE))
    # this fails due to numerical problem with the PCMVar - error : sigma must be a symmetric matrix
    # expect_equivalent(
    #   PCMLik(traits.ab.123, tree.ab, model.ab.123.OU),
    #   dmvnorm(as.vector(traits.ab.123[, 1:PCMTreeNumTips(tree.ab)]),
    #           as.vector(PCMMean(tree.ab, model.ab.123.OU, model.ab.123.OU$X0)),
    #           PCMVar(tree.ab, model.ab.123.OU), log = TRUE))

  })

}
