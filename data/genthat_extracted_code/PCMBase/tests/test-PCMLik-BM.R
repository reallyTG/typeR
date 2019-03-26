library(testthat)
context("PCMLik, OU")

library(PCMBase)

if(PCMBaseIsADevRelease()) {

  library(mvtnorm)

  list2env(PCMBaseTestObjects, globalenv())

  set.seed(1, kind = "Mersenne-Twister", normal.kind = "Inversion")

  test_that("Equal likelihood with dmvnorm on a random model, single regime (a)", {
    expect_silent(model.a.123.BM <- PCM("BM", k = 3, regimes = "a"))
    expect_silent(PCMParamLoadOrStore(model.a.123.BM,
                                      PCMParamRandomVecParams(model.a.123.BM),
                                      offset = 0, k = 3, load = TRUE))
    expect_equivalent(
      PCMLik(traits.a.123, tree.a, model.a.123.BM),
      dmvnorm(as.vector(traits.a.123[, 1:PCMTreeNumTips(tree.a)]),
              as.vector(PCMMean(tree.a, model.a.123.BM, model.a.123.BM$X0)),
              PCMVar(tree.a, model.a.123.BM), log = TRUE))

  })

  test_that("Equal likelihood with dmvnorm on a random model, with single regime (a) and SE >0", {
    expect_silent(model.a.123.BM <- PCM("BM", k = 3, regimes = "a"))
    expect_silent(PCMParamLoadOrStore(model.a.123.BM,
                                      PCMParamRandomVecParams(model.a.123.BM),
                                      offset = 0, k = 3, load = TRUE))
    expect_equivalent(
      PCMLik(traits.a.123, tree.a, model.a.123.BM, SE = abs(0.01*traits.a.123[, seq_len(PCMTreeNumTips(tree.a))])),
      PCMLikDmvNorm(traits.a.123, tree.a, model.a.123.BM, SE = abs(0.01*traits.a.123[, seq_len(PCMTreeNumTips(tree.a))])))
    expect_equivalent(
      PCMLik(traits.a.123, tree.a, model.a.123.BM, SE = abs(0.01*traits.a.123[, seq_len(PCMTreeNumTips(tree.a))])),
      {
        dmvnorm(
          as.vector(traits.a.123[, 1:PCMTreeNumTips(tree.a)]),
          as.vector(PCMMean(tree.a, model.a.123.BM, model.a.123.BM$X0)),
          PCMVar(tree.a, model.a.123.BM) + diag(abs(0.01*as.vector(traits.a.123[, 1:PCMTreeNumTips(tree.a)]))^2),
          log = TRUE
        )
      }
    )

  })

  test_that("Equal likelihood with dmvnorm on a random model, multiple regimes (ab)", {
    expect_silent(model.ab.123.BM <- PCM("BM", k = 3, regimes = c("a", "b")))
    expect_silent(PCMParamLoadOrStore(model.ab.123.BM,
                                      PCMParamRandomVecParams(model.ab.123.BM),
                                      offset = 0, k = 3, load = TRUE))
    expect_equivalent(
      PCMLik(traits.ab.123, tree.ab, model.ab.123.BM),
      dmvnorm(as.vector(traits.ab.123[, 1:PCMTreeNumTips(tree.ab)]),
              as.vector(PCMMean(tree.ab, model.ab.123.BM, model.ab.123.BM$X0)),
              PCMVar(tree.ab, model.ab.123.BM), log = TRUE))

  })
}

