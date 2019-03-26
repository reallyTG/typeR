library(FixedPoint)
library(testthat)
library(SQUAREM)
context("Testing cubic root in 6 dimensions.")

Test_Of_Convergence = function(Function = function(x){ sign(x) * abs(x)^(1/3) }, Inputs = c(0.3, 0.4,0.5,0.6,0.7,0.8), Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-10, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10){

  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  cat(paste0("The ", Method, " method took ", length(A$Convergence), " iterations and finished with ", A$Finish, "\n"))
  return((A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold))
}

test_that("Testing that each method converges in the cubic root case to within tolerance", {
  expect_true(Test_Of_Convergence(Method = "Anderson")) # This takes 12  iterations.
  expect_true(Test_Of_Convergence(Method = "Simple"))   # This takes 22  iterations.
  expect_true(Test_Of_Convergence(Method = "Aitken"))   # This takes 9   iterations.
  expect_true(Test_Of_Convergence(Method = "Newton"))   # This takes 9  iterations.
  expect_true(Test_Of_Convergence(Method = "MPE"))      # This takes 9   iterations.
  expect_true(Test_Of_Convergence(Method = "RRE"))      # This takes 10  iterations.
  expect_true(Test_Of_Convergence(Method = "VEA"))      # This takes 13  iterations.
  expect_true(Test_Of_Convergence(Method = "SEA"))      # This takes 13  iterations.
})
Func = function(x){ sign(x) * abs(x)^(1/3) }
Inputs = c(0.3, 0.4,0.5,0.6,0.7,0.8)
sqm = SQUAREM::squarem(Inputs,Func, control=list(tol= 1e-10*4 ))
convergence = sum(abs(sqm$par - Func(sqm$par) ))
cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # This takes 12 iterations.




Test_Of_FullDampening = function(Function = function(x){ sqrt(0.5*x) }, Inputs = c(0.3, 0.4,0.5,0.6,0.7,0.8), Outputs = c(), ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-07, MaxIter = 1e3, MaxM = 10, PrintReports = FALSE, ReportingSigFig = 5){
  # Under full dampening (Dampening = 0) all methods in fact use the simple method. Thus convergence vectors from all should be equal.
  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = "Anderson", ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = 0, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  B = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = "Simple", ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = 0, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  C = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = "Aitken", ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = 0, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  D = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = "Newton", ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = 0, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  E = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = "MPE", ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = 0, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  G = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = "RRE", ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = 0, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  H = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = "VEA", ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = 0, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  I = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = "SEA", ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = 0, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  return(all(abs(A$Convergence - C$Convergence) < 1e-10, abs(B$Convergence - C$Convergence) < 1e-10, abs(C$Convergence - D$Convergence) < 1e-10,  abs(D$Convergence - E$Convergence) < 1e-10,  abs(E$Convergence - G$Convergence) < 1e-10,  abs(G$Convergence - H$Convergence) < 1e-10,  abs(H$Convergence - I$Convergence) < 1e-10 ))
}

test_that("Testing that full dampening means that all methods are same as simple iteration", {
  expect_true(Test_Of_FullDampening())
})
