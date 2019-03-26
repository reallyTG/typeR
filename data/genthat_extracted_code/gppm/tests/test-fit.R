context('fit')
test_that("useOptimizerFalse", {
  lgcmFakeFit <- fit(lgcm,useOptimizer=FALSE,init=parameterValues)
  expect_equal(coef(lgcmFakeFit)[names(parameterValues)],parameterValues)
})

test_that("Paras in Confint", {
  #for this seed all true paras are in data set
  confInters <- confint(lgcmFit)
  for (cPar in names(trueParas)){
    expect_true(confInters[cPar,1] < trueParas[cPar] && confInters[cPar,2] > trueParas[cPar])
  }
})

test_that("always reach ML estimates", {
  skip_on_cran()
  lgcmFit2 <-fit(lgcm)
  expect_equal(lgcmFit2,lgcmFit,tolerance=0.05)
})




