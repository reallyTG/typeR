library(FixedPoint)
library(testthat)
library(SQUAREM)
context("Testing cosine function in 6 dimensions.")

Test_Of_Convergence = function(Function = function(x){ cos(x) }, Inputs = c(0.3, 0.4,0.5,0.6,0.7,0.8), Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-10, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10,  DropOldIterates = FALSE){
  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig,  DropOldIterates = DropOldIterates)
  cat(paste0("The ", Method, " method took ", A$fpevals, " iterations and finished with ", A$Finish, "\n"))
  return((A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold))
}

test_that("Testing that each method converges in the cos(x)  case to within tolerance", {
  expect_true(Test_Of_Convergence(Method = "Anderson")) # This takes 10  iterations.
  expect_true(Test_Of_Convergence(Method = "Anderson", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "Simple"))   # This takes 58  iterations.
  expect_true(Test_Of_Convergence(Method = "Simple", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "Aitken"))   # This takes 11  iterations.
  expect_true(Test_Of_Convergence(Method = "Aitken", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "Newton"))   # This takes 9   iterations.
  expect_true(Test_Of_Convergence(Method = "Newton", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "MPE"))      # This takes 13  iterations.
  expect_true(Test_Of_Convergence(Method = "MPE", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "RRE"))      # This takes 13  iterations.
  expect_true(Test_Of_Convergence(Method = "RRE", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "VEA"))      # This takes 13  iterations.
  expect_true(Test_Of_Convergence(Method = "VEA", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "SEA"))      # This takes 13  iterations.
  expect_true(Test_Of_Convergence(Method = "SEA", DropOldIterates = TRUE))
})
Function = function(x){ cos(x) }
Inputs = c(0.3, 0.4,0.5,0.6,0.7,0.8)
SQUAREM::squarem(Inputs,Function, control=list(tol= 1e-10*4 ))


Test_Of_Convergence = function(Function = function(x){ cos(x) }, Inputs = c(0.3, 0.4), Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-10, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10){

  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  cat(paste0("The ", Method, " method took ", A$fpevals, " iterations and finished with ", A$Finish, "\n"))
  return((A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold))
}

test_that("Testing that each method converges in the cos(x)  case to within tolerance", {
  expect_true(Test_Of_Convergence(Method = "Anderson")) # This takes 8   iterations.
  expect_true(Test_Of_Convergence(Method = "Simple"))   # This takes 58  iterations.
  expect_true(Test_Of_Convergence(Method = "Aitken"))   # This takes 11  iterations.
  expect_true(Test_Of_Convergence(Method = "Newton"))   # This takes 9   iterations.
  expect_true(Test_Of_Convergence(Method = "MPE"))      # This takes 17  iterations.
  expect_true(Test_Of_Convergence(Method = "RRE"))      # This takes 19  iterations.
  expect_true(Test_Of_Convergence(Method = "VEA"))      # This takes 13  iterations.
  expect_true(Test_Of_Convergence(Method = "SEA"))      # This takes 13  iterations.

})
Function = function(x){ cos(x) }
Inputs = c(0.3, 0.4)
sqm = SQUAREM::squarem(Inputs,Function, control=list(tol= 1e-10*4 ))
convergence = sum(abs(sqm$par - Function(sqm$par) ))
cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # This takes 55 iterations.




Test_Of_Convergence = function(Function = function(x){ cos(x) }, Inputs = 0.3, Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-10, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10, DropOldIterates = FALSE){

  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig, DropOldIterates = DropOldIterates)
  cat(paste0("The ", Method, " method took ", A$fpevals, " iterations and finished with ", A$Finish, "\n"))
  return((A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold))
}

test_that("Testing that each method converges in the cos(x)  case to within tolerance", {
  expect_true(Test_Of_Convergence(Method = "Anderson")) # This takes 7   iterations.
  expect_true(Test_Of_Convergence(Method = "Anderson", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "Anderson", DropOldIterates = TRUE, MaxM = 3))
  expect_true(Test_Of_Convergence(Method = "Simple"))   # This takes 58  iterations.
  expect_true(Test_Of_Convergence(Method = "Simple", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "Aitken"))   # This takes 11  iterations.
  expect_true(Test_Of_Convergence(Method = "Aitken", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "Newton"))   # This takes 9   iterations.
  expect_true(Test_Of_Convergence(Method = "Newton", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "MPE"))      # This takes 19  iterations.
  expect_true(Test_Of_Convergence(Method = "MPE", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "RRE"))      # This takes 25  iterations.
  expect_true(Test_Of_Convergence(Method = "RRE", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "VEA"))      # This takes 13  iterations.
  expect_true(Test_Of_Convergence(Method = "VEA", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "SEA"))      # This takes 13  iterations.
  expect_true(Test_Of_Convergence(Method = "SEA", DropOldIterates = TRUE))
})
Function = function(x){ cos(x) }
Inputs = c(0.3)
sqm = SQUAREM::squarem(Inputs,Function, control=list(tol= 1e-10*4 ))
convergence = sum(abs(sqm$par - Function(sqm$par) ))
cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # This takes 55 iterations.


