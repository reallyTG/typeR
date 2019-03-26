library(testthat)
context("MixedGaussian likelihood test")

library(PCMBase)

if(PCMBaseIsADevRelease()) {

  list2env(PCMBaseTestObjects, globalenv())

  # generate some  models
  test_that("Calling PCMGenerateParameterizations()", {
    expect_silent(tableParametrizationsOU <- PCMTableParameterizations(structure(0.0, class="OU")))
    expect_true(is.data.table(tableParametrizationsOU))
    expect_silent(
      PCMGenerateParameterizations(
        model = structure(0.0, class="OU"),
        tableParameterizations = tableParametrizationsOU[
          sapply(X0, function(type)
            identical(type, c("VectorParameter", "_Global")) ||
              identical(type, c("VectorParameter", "_Omitted"))
          ) &
            sapply(H, function(type)
              identical(type, c("MatrixParameter"))) &
            sapply(Theta, function(type)
              identical(type, "VectorParameter") )
          ])
    )
    expect_silent(tableParametrizationsBM <- PCMTableParameterizations(structure(0.0, class="BM")))
    expect_true(is.data.table(tableParametrizationsBM))
    expect_silent(
      PCMGenerateParameterizations(
        model = structure(0.0, class="BM"),
        tableParameterizations = tableParametrizationsBM[
          sapply(X0, function(type)
            identical(type, c("VectorParameter", "_Global")) ||
              identical(type, c("VectorParameter", "_Omitted")) ), ])
    )
  })

  test_that(
    "Generated OU parametrizations", {
      expect_true(is.function(PCMSpecify.OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigmae_x))
    })

  # regime 'a', trait 1
  model.a.1.Omitted_X0 <- PCM(
    "OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigmae_x",
    k = 1,
    regimes = "a",
    params = list(H=H[1,1,'a',drop=FALSE],
                  Theta=Theta[1,'a',drop=FALSE],
                  Sigma_x=Sigma_x[1,1,'a',drop=FALSE],
                  Sigmae_x=Sigmae_x[1,1,'a',drop=FALSE]))


  # regime 'a', traits 1, 2 and 3
  model.a.123.Omitted_X0 <- PCM(
    "OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigmae_x",
    k = 3,
    regimes = "a",
    params = list(H=H[,,'a',drop=FALSE],
                  Theta=Theta[,'a',drop=FALSE],
                  Sigma_x=Sigma_x[,,'a',drop=FALSE],
                  Sigmae_x=Sigmae_x[,,'a',drop=FALSE]))


  # regime 'b', traits 1, 2 and 3
  model.b.123.Omitted_X0 <- PCM(
    "OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigmae_x",
    k = 3L,
    regimes = "b",
    params = list(H=H[,,'b',drop=FALSE],
                  Theta=Theta[,'b',drop=FALSE],
                  Sigma_x=Sigma_x[,,'b',drop=FALSE],
                  Sigmae_x=Sigmae_x[,,'b',drop=FALSE]))

  model_MixedGaussian_ab <- MixedGaussian(
    k = 3L,
    modelTypes = "OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigmae_x",
    mapping = c(a = 1, b = 1),
    className = "MixedGaussian_ab",
    Sigmae_x = structure(0.0, class = c("MatrixParameter", "_Omitted")))

  PCMParamSetByName(model_MixedGaussian_ab,
                    list(X0 = a.X0,
                         a = model.a.123.Omitted_X0,
                         b = model.b.123.Omitted_X0))




  # regime 'a', traits 1, 2 and 3
  model.a.123.Omitted_X0__bSigmae_x <- PCM(
    "OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigmae_x", k = 3, regimes = "a",
    params = list(H=H[,,'a',drop=FALSE],
                  Theta=Theta[,'a',drop=FALSE],
                  Sigma_x=Sigma_x[,,'a',drop=FALSE],
                  Sigmae_x=Sigmae_x[,,'b',drop=FALSE]))


  # regimes 'a' and 'b', traits 1, 2 and 3
  model.ab.123.bSigmae_x <- PCM(
    "OU", k = 3, regimes = c("a", "b"),
    params = list(X0 = a.X0,
                  H=H[,,,drop=FALSE],
                  Theta=Theta[,,drop=FALSE],
                  Sigma_x=Sigma_x[,,,drop=FALSE],
                  Sigmae_x=Sigmae_x[,,c('b', 'b'),drop=FALSE]))

  model.a.123.Omitted_X0__Omitted_Sigmae_x <- PCM(
    "OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__Omitted_Sigmae_x", k = 3, regimes = "a",
    params = list(H=H[,,'a',drop=FALSE],
                  Theta=Theta[,'a',drop=FALSE],
                  Sigma_x=Sigma_x[,,'a',drop=FALSE]))

  model.b.123.Omitted_X0__Omitted_Sigmae_x <- PCM(
    "OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__Omitted_Sigmae_x", k = 3, regimes = "b",
    params = list(H=H[,,'b',drop=FALSE],
                  Theta=Theta[,'b',drop=FALSE],
                  Sigma_x=Sigma_x[,,'b',drop=FALSE]))


  model_MixedGaussian_ab_globalSigmae_x <- MixedGaussian(
    k = 3,
    modelTypes = "OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__Omitted_Sigmae_x",
    mapping = c(a = 1, b = 1),
    className = "MixedGaussian_ab_globalSigmae_x")

  PCMParamSetByName(model_MixedGaussian_ab_globalSigmae_x,
                    list(X0 = a.X0,
                         a = model.a.123.Omitted_X0__Omitted_Sigmae_x,
                         b = model.b.123.Omitted_X0__Omitted_Sigmae_x,
                         Sigmae_x=Sigmae_x[,,'b',drop=TRUE]))

  test_that("Equal OU and MixedGaussian likelihoods", expect_equal(
    PCMLik(traits.ab.123[, 1:PCMTreeNumTips(tree.ab)], tree.ab, model_MixedGaussian_ab),
    PCMLik(traits.ab.123[, 1:PCMTreeNumTips(tree.ab)], tree.ab, model.ab.123)
  ))


  test_that("Equal OU and MixedGaussian likelihoods with global Sigmae_x", expect_equal(
    PCMLik(traits.ab.123, tree.ab, model_MixedGaussian_ab_globalSigmae_x),
    PCMLik(traits.ab.123, tree.ab, model.ab.123.bSigmae_x)
  ))

  set.seed(1, kind = "Mersenne-Twister", normal.kind = "Inversion")

  test_that("Generate a random MixedGaussian model", {
    expect_silent(model.ab.123.MG <- MixedGaussian(
      k = 3,
      modelTypes = c("BM__Omitted_X0__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__Omitted_Sigmae_x",
                     "OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__Omitted_Sigmae_x"),
      mapping = c(a=2L, b=1L), className = "MG"))
    expect_silent(PCMParamLoadOrStore(model.ab.123.MG,
                                      PCMParamRandomVecParams(model.ab.123.MG),
                                      offset = 0, k = 3, load = TRUE))
  })

}
