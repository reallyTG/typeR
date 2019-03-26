library(measures)

context("Output check")

test_that("regression measures provide an output", {
  n = 20
  p = 5
  set.seed(123)
  truth = rnorm(n)
  response = rnorm(n)
  expect_true(is.numeric(SSE(truth, response)))
  expect_true(is.numeric(MSE(truth, response)))
  expect_true(is.numeric(RMSE(truth, response)))
  expect_true(is.numeric(MEDSE(truth, response)))
  expect_true(is.numeric(SAE(truth, response)))
  expect_true(is.numeric(MAE(truth, response)))
  expect_true(is.numeric(MEDAE(truth, response)))
  expect_true(is.numeric(RSQ(truth, response)))
  expect_true(is.numeric(EXPVAR(truth, response)))
  expect_true(is.numeric(ARSQ(truth, response, n, p)))
  expect_true(is.numeric(RRSE(truth, response)))
  expect_true(is.numeric(RAE(truth, response)))
  expect_true(is.numeric(MAPE(truth, response)))
  expect_true(is.numeric(MSLE(abs(truth), abs(response))))
  expect_true(is.numeric(RMSLE(abs(truth), abs(response))))
  expect_true(is.numeric(KendallTau(truth, response)))
  expect_true(is.numeric(SpearmanRho(truth, response)))
})

test_that("binary classification measures provide an output", {
  n = 20
  set.seed(125)
  truth = as.factor(sample(c(1,0), n, replace = TRUE))
  probabilities = runif(n)
  response = as.factor(as.numeric(probabilities > 0.5))
  positive = 1
  negative = 0
  expect_true(is.numeric(AUC(probabilities, truth, negative, positive)))
  expect_true(is.numeric(Brier(probabilities, truth, negative, positive)))
  expect_true(is.numeric(BrierScaled(probabilities, truth, negative, positive)))
  expect_true(is.numeric(BAC(truth, response, negative, positive)))
  expect_true(is.numeric(TP(truth, response, positive)))
  expect_true(is.numeric(TN(truth, response, negative)))
  expect_true(is.numeric(FP(truth, response, positive)))
  expect_true(is.numeric(FN(truth, response, negative)))
  expect_true(is.numeric(TPR(truth, response, positive)))
  expect_true(is.numeric(TNR(truth, response, negative)))
  expect_true(is.numeric(FPR(truth, response, negative, positive)))
  expect_true(is.numeric(FNR(truth, response, negative, positive)))
  expect_true(is.numeric(PPV(truth, response, positive, probabilities = NULL)))
  expect_true(is.numeric(NPV(truth, response, negative)))
  expect_true(is.numeric(FDR(truth, response, positive)))
  expect_true(is.numeric(MCC(truth, response, negative, positive)))
  expect_true(is.numeric(F1(truth, response, positive)))
  expect_true(is.numeric(GMEAN(truth, response, negative, positive)))
  expect_true(is.numeric(GPR(truth, response, positive)))
})

test_that("multiclass classification measures provide an output", {
  n = 20
  set.seed(122)
  truth = as.factor(sample(c(1,2,3), n, replace = TRUE))
  probabilities = matrix(runif(60), 20, 3)
  probabilities = probabilities/rowSums(probabilities)
  colnames(probabilities) = c(1,2,3)
  response = as.factor(apply(probabilities,1,function(x) which(x==max(x))))
  
  expect_true(is.numeric(MMCE(truth, response)))
  expect_true(is.numeric(ACC(truth, response)))
  expect_true(is.numeric(BER(truth, response)))
  expect_true(is.numeric(multiclass.AUNU(probabilities, truth)))
  expect_true(is.numeric(multiclass.AUNP(probabilities, truth)))
  expect_true(is.numeric(multiclass.AU1U(probabilities, truth)))
  expect_true(is.numeric(multiclass.AU1P(probabilities, truth)))
  expect_true(is.numeric(multiclass.Brier(probabilities, truth)))
  expect_true(is.numeric(Logloss(probabilities, truth)))
  expect_true(is.numeric(SSR(probabilities, truth)))
  expect_true(is.numeric(QSR(probabilities, truth)))
  expect_true(is.numeric(LSR(probabilities, truth)))
  expect_true(is.numeric(KAPPA(truth, response)))
  expect_true(is.numeric(WKAPPA(truth, response)))
})

test_that("multilabel classification measures provide an output", {
  n = 20
  set.seed(122)
  truth = matrix(sample(c(0,1), 60, replace = TRUE), 20, 3)
  response = matrix(sample(c(0,1), 60, replace = TRUE), 20, 3)
  
  expect_true(is.numeric(MultilabelHamloss(truth, response)))
  expect_true(is.numeric(MultilabelSubset01(truth, response)))
  expect_true(is.numeric(MultilabelF1(truth, response)))
  expect_true(is.numeric(MultilabelACC(truth, response)))
  expect_true(is.numeric(MultilabelPPV(truth, response)))
  expect_true(is.numeric(MultilabelTPR(truth, response)))
})

test_that("listing measures", {
  expect_true(is.data.frame(listAllMeasures()))
})