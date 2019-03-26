library(testthat)
context("PCMLik, DOU")

library(PCMBase)

if(PCMBaseIsADevRelease()) {

  library(mvtnorm)

  list2env(PCMBaseTestObjects, globalenv())

  test_that("Calling PCMGenerateParameterizations()", {
    expect_silent(tableParametrizationsDOU <- PCMTableParameterizations(structure(0.0, class="DOU")))
    expect_silent(
      PCMGenerateParameterizations(
        model = structure(0.0, class="DOU"),

        # note that I am not using data.table but data.frame syntax for subsetting
        # tableParameterizationsOU. This to avoid a problem with devtools::test
        # see https://github.com/r-lib/devtools/issues/192
        # Another work-around would be to add data.table to Depends:, but I don't
        # want this now.
        tableParameterizations = tableParametrizationsDOU[
          sapply(X0, function(type)
            identical(type, c("VectorParameter", "_Global")) ) &
            sapply(H1, function(type)
              identical(type, c("MatrixParameter", "_Schur", "_WithNonNegativeDiagonal", "_Transformable"))) &
            sapply(H2, function(type)
              identical(type, c("MatrixParameter", "_Schur", "_WithNonNegativeDiagonal", "_Transformable"))) &
            sapply(Theta, function(type)
              identical(type, "VectorParameter") ), ])
    )
  })
  set.seed(1, kind = "Mersenne-Twister", normal.kind = "Inversion")

  test_that("Equal likelihood with dmvnorm on a random model, single regime (a)", {
    expect_silent(model.a.123.DOU <- PCM("DOU__Global_X0__Schur_WithNonNegativeDiagonal_Transformable_H1__Schur_WithNonNegativeDiagonal_Transformable_H2__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Global_Sigmae_x", k = 3, regimes = "a"))
    expect_silent(PCMParamLoadOrStore(model.a.123.DOU,
                                      PCMParamRandomVecParams(model.a.123.DOU),
                                      offset = 0, k = 3, load = TRUE))
    #expect_silent(traits.a.123.DOU <- PCMSim(tree.a, model.a.123.DOU, model.a.123.DOU$X0) )
    expect_true(is.finite(PCMLik(traits.a.123, tree.a, model.a.123.DOU)))
    expect_true(abs(PCMLik(traits.a.123, tree.a, model.a.123.DOU) -
                 PCMLikDmvNorm(traits.a.123, tree.a, model.a.123.DOU)) < 5)

  })

  test_that("Equal likelihood with dmvnorm on a random model, multiple regimes (ab)", {
    expect_silent(model.ab.123.DOU <- PCM("DOU__Global_X0__Schur_WithNonNegativeDiagonal_Transformable_H1__Schur_WithNonNegativeDiagonal_Transformable_H2__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Global_Sigmae_x", k = 3, regimes = c("a", "b")))
    expect_silent(PCMParamLoadOrStore(model.ab.123.DOU,
                                      PCMParamRandomVecParams(model.ab.123.DOU),
                                      offset = 0, k = 3, load = TRUE))
    #expect_silent(traits.ab.123.DOU <- PCMSim(tree.ab, model.ab.123.DOU, model.ab.123.DOU$X0) )
    expect_true(is.finite(PCMLik(traits.ab.123, tree.ab, model.ab.123.DOU)))
    expect_true(abs(PCMLik(traits.ab.123, tree.ab, model.ab.123.DOU) -
                 PCMLikDmvNorm(traits.ab.123, tree.ab, model.ab.123.DOU)) < 5)

  })

}
