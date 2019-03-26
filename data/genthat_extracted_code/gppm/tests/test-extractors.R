context('extractors')
test_that("coef", {
  expect_equal(coef(lgcmFit)[names(parameterValues)],parameterValues,tol=0.1)
})

test_that("vcov", {
  expect_true(isSymmetric(vcov(lgcmFit)))
})


test_that("SE", {
  expect_identical(names(SE(lgcmFit)[names(parameterValues)]),names(parameterValues))
})

test_that("confint", {
  expect_identical(rownames(confint(lgcmFit)[names(parameterValues),]),names(parameterValues))
})

test_that("logLik", {
  expect_identical(class(logLik(lgcmFit)),"logLik")
})

test_that("fitted", {
  tmp <- fitted(lgcmFit)
  expect_equal(length(tmp$ID),250)
  expect_equal(length(tmp$mean),250)
  expect_equal(length(tmp$cov),250)
})

test_that("nPers", {
  expect_equal(nPers(lgcmFit),250)
})

test_that("nPars", {
  expect_equal(nPars(lgcmFit),6)
})

test_that("maxnObs", {
  expect_equal(maxnObs(lgcmFit),11)
})

test_that("nObs", {
expect_equal(length(nObs(lgcmFit)),250)
})

test_that("nPreds", {
  expect_equal(nPreds(lgcmFit),1)
})

test_that("preds", {
  expect_equal(preds(lgcmFit),'t')
})

test_that("pars", {
  expect_equal(pars(lgcmFit),names(parameterValues[pars(lgcmFit)]))
})

test_that("parEsts", {
  expect_identical(parEsts(lgcmFit)[,'Param'],names(parameterValues[parEsts(lgcmFit)[,'Param']]))
})

test_that("meanf", {
  expect_identical(meanf(lgcmFit),"muI+muS*t")
})

test_that("covf", {
  expect_identical(covf(lgcmFit),"varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma")
})


test_that("datas", {
  expect_identical(datas(lgcmFit),demoLGCM)
})


test_that("getIntern", {
  expect_identical(getIntern(lgcmFit,'parsedmFormula'),"muI+muS*X[i,j,1]")
  expect_identical(getIntern(lgcmFit,'parsedcFormula'),"varI+covIS*(X[i,j,1]+X[i,k,1])+varS*X[i,j,1]*X[i,k,1]+(X[i,j,1]==X[i,k,1])*sigma")
  expect_equal(getIntern(lgcmFit,'stanData')$nPer,250)
  expect_equal(class(getIntern(lgcmFit,'stanModel'))[1],"stanmodel")
  expect_identical(class(getIntern(lgcmFit,'stanOut')),"list")
})
