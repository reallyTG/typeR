library(FixedPoint)
library(testthat)
context("Testing pushing thorugh errors.")

Test_Of_GracefulError = function(Function = function(x){c(0.5*sqrt((x[1] + x[2])), 1.5*x[1] + 0.5*x[2])}, Inputs = c(0.3,900), Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-10, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = TRUE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10){
  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  return((A$Finish == "New output vector contains NAs" & (!is.null(A$Outputs))))
}

test_that("Testing Graceful Errors", {
  expect_true(Test_Of_GracefulError(Method = "Anderson"))
})



