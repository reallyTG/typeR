#### Test that forest is working.
context("Forest testing")

test_that("Building Forests", {

  ### To have forest tests run a little faster, reducing dataset size
  nlsySample_small <- nlsySample[nlsySample$ID %in% sample(unique(nlsySample$ID), 300),]
  sample_forest <- splineForest(BMI~HISP+WHITE+BLACK+HGC_MOTHER+HGC_FATHER+SEX+Num_sibs, BMI~AGE, "ID", nlsySample_small, degree=1, df=2, intercept=FALSE, cp=0.001, ntree=10)
  forest2 <- splineForest(BMI~HISP+WHITE+BLACK+HGC_FATHER+Num_sibs+HGC_MOTHER+SEX, BMI~AGE, "ID", nlsySample_small, degree=1, df=3, intercept=TRUE, cp=0.001, ntree=10)
  expect_is(forest2, "list")
  preds_coeffs = predictCoeffsForest(forest2, method="all")
  expect_equal(dim(preds_coeffs), c(3, 300))
  projectedR2Forest(forest2, method="all")
  preds_y <- predictYForest(forest2, method="oob")
  expect_equal(length(preds_y), NROW(nlsySample_small))
  Cimp = varImpCoeff(forest2, method="oob")
  expect_equal(dim(Cimp), c(7, 3))
  Yimp = varImpY(forest2, method="all")
  expect_equal(dim(Yimp), c(7, 3))
  expect_true(projectedR2Forest(forest2, method="all")>0)
  expect_true(projectedR2Forest(forest2, method="all", removeIntercept = FALSE)>0)
  expect_true(yR2Forest(forest2, method="all")>0)
})


