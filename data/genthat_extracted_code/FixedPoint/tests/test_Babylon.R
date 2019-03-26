library(FixedPoint)
library(testthat)
library(SQUAREM)
context("Testing Babylonian square root in 1 dimension")

SequenceFunction = function(tn){0.5*(tn + 100/tn)}
Test_Of_Convergence = function(Function = SequenceFunction, Inputs = c(6), Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-10, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10){

  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  cat(paste0("The ", Method, " method took ", length(A$Convergence), " iterations and finished with ", A$Finish, "\n"))
  return((A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold))
}

test_that("Testing that each method converges in the Babylonian square root case to within tolerance", {
  expect_true(Test_Of_Convergence(Method = "Anderson")) # This takes 7  iterations.
  expect_true(Test_Of_Convergence(Method = "Simple"))   # This takes 6  iterations.
  expect_true(Test_Of_Convergence(Method = "Aitken"))   # This takes 7  iterations.
  expect_true(Test_Of_Convergence(Method = "Newton"))   # This takes 7  iterations.
  expect_true(Test_Of_Convergence(Method = "MPE"))      # This takes 6  iterations.
  expect_true(Test_Of_Convergence(Method = "RRE"))      # This takes 6  iterations.
  expect_true(Test_Of_Convergence(Method = "VEA"))      # This takes 6  iterations.
  expect_true(Test_Of_Convergence(Method = "SEA"))      # This takes 6  iterations.
})
sqm = SQUAREM::squarem(6,SequenceFunction, control=list(tol= 1e-10*4 ))
convergence = sum(abs(sqm$par - SequenceFunction(sqm$par) ))
cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # This takes 6 iterations.


context("Testing Babylonian square root in 100 dimensions")

NumbersVector = 1:100
SequenceFunction = function(tn){0.5*(tn + NumbersVector/tn)}
Test_Of_Convergence = function(Function = SequenceFunction, Inputs = 1:100, Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-10, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10){

  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  cat(paste0("The ", Method, " method took ", length(A$Convergence), " iterations and finished with ", A$Finish, "\n"))
  return((A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold))
}

test_that("Testing that each method converges in the vector Babylonian  case to within tolerance", {
  expect_true(Test_Of_Convergence(Method = "Anderson")) # This takes 30  iterations.
  expect_true(Test_Of_Convergence(Method = "Simple"))   # This takes 9   iterations.
  expect_true(Test_Of_Convergence(Method = "Aitken"))   # This takes 10  iterations.
  expect_true(Test_Of_Convergence(Method = "Newton"))   # This takes 10  iterations.
  expect_true(Test_Of_Convergence(Method = "MPE"))      # This takes 9   iterations.
  expect_true(Test_Of_Convergence(Method = "RRE"))      # This takes 9   iterations.
  expect_true(Test_Of_Convergence(Method = "VEA"))      # This takes 11  iterations.
  expect_true(Test_Of_Convergence(Method = "SEA"))      # This takes 9   iterations.

})
sqm = SQUAREM::squarem(1:100,SequenceFunction, control=list(tol= 1e-10*4 ))
convergence = sum(abs(sqm$par - SequenceFunction(sqm$par) ))
cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # This takes 9 iterations.

