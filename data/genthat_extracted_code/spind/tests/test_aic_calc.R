context('aic.calc tests')


test_that('aic.calc returns correct values',{
  data(musdata)
  coords <- musdata[ ,4:5]
  mglm <- glm(musculus ~ pollution + exposure, "poisson", musdata)

  aic <- aic.calc(musculus ~ pollution + exposure, "poisson", musdata,
                  mglm$fitted)

  expect_equal(aic$AIC, mglm$aic, tolerance = 1e-2)
  expect_match(class(aic), 'list')

})