context("gppm-easychecks")
test_that("wrong variable names", {
  tmpData <- myDataLong
  names(tmpData)[3] <- 't '
  expect_error(gpModel <- gppm('b0+b1*t','(t==t#)*sigma',tmpData,control=controls),'Invalid variable name')
  names(tmpData)[3] <- 't!#'
  expect_error(gpModel <- gppm('b0+b1*t','(t==t#)*sigma',tmpData,control=controls),'Invalid variable name')
  names(tmpData)[3] <- 'Ha ha'
  expect_error(gpModel <- gppm('b0+b1*t','(t==t#)*sigma',tmpData,control=controls),'Invalid variable name')
  names(tmpData)[3] <- '3D5'
  expect_error(gpModel <- gppm('b0+b1*t','(t==t#)*sigma',tmpData,control=controls),'Invalid variable name')
})

test_that("ID not in", {
  expect_error(gpModel <- gppm('b0+b1*t','(t==t#)*sigma',myData,ID='ID2',DV='y',control=controls),'ID variable')
})

test_that("DV not in", {
  expect_error(gpModel <- gppm('b0+b1*t','(t==t#)*sigma',myData,ID='ID',DV='y2',control=controls),'DV variable')
})




context("gppm-meanCovariance")
test_that("linear regression", {
  gpModel <- gppm('b0+b1*t','(t==t#)*sigma',myDataLong,control=controls)

  mFormula <- getIntern(gpModel,'parsedmFormula')
  cFormula <- getIntern(gpModel,'parsedcFormula')

  expect_equal(mFormula,"b0+b1*X[i,j,1]")
  expect_equal(cFormula,"(X[i,j,1]==X[i,k,1])*sigma")

  myModelSpec <- summary(gpModel)$modelSpecification

  expect_equal(myModelSpec$meanFormula,"b0+b1*t")
  expect_equal(myModelSpec$covFormula,"(t==t#)*sigma")
  expect_equal(myModelSpec$params,c('b0','b1','sigma'))
  expect_equal(myModelSpec$nPars,3)
  expect_equal(myModelSpec$preds,c('t'))
  expect_equal(myModelSpec$nPreds,1)

})

test_that("Bayesian Linear regression", {
  gpModel <- gppm('0','(t*t#+1)*sigmab+(t==t#)*sigma',myDataLong,control=controls)

  mFormula <- getIntern(gpModel,'parsedmFormula')
  cFormula <- getIntern(gpModel,'parsedcFormula')

  expect_equal(mFormula,"0")
  expect_equal(cFormula,"(X[i,j,1]*X[i,k,1]+1)*sigmab+(X[i,j,1]==X[i,k,1])*sigma")
})

test_that("squared exponential", {
  gpModel <- gppm('c','sigmaf*exp(-(t-t#)^2/rho)+(t==t#)*sigma',myDataLong,control=controls)

  mFormula <- getIntern(gpModel,'parsedmFormula')
  cFormula <- getIntern(gpModel,'parsedcFormula')

  expect_equal(mFormula,"c")
  expect_equal(cFormula,"sigmaf*exp(-(X[i,j,1]-X[i,k,1])^2/rho)+(X[i,j,1]==X[i,k,1])*sigma")
})

test_that("hard names", {
  tmp <- myData
  names(tmp) <- c('ID45','t83','y13')
  gpModel <- gppm('b0+b1*t83','(t83==t83#)*sigma',tmp,ID='ID45',DV='y13',control=controls)

  mFormula <- getIntern(gpModel,'parsedmFormula')
  cFormula <- getIntern(gpModel,'parsedcFormula')

  expect_equal(mFormula,"b0+b1*X[i,j,1]")
  expect_equal(cFormula,"(X[i,j,1]==X[i,k,1])*sigma")
})




