library(FixedPoint)
library(testthat)
library(SQUAREM)
context("Testing all convergence methods for a simple vector dependent fixed point problem. This means x[2] depends directly on previous x[1]s and x[2]s and similarly for x[1].")

# Note that this has three fixed points. (0,0) and (1,3) and (-1,3).
# If we remove the absolute value function from inside the sqrt then there are only the first two. If this were our actual function
# only simple iteration would work while the other two would eventually return a negative in the square root and cause an error.

Test_Of_Convergence = function(Function = function(x){c(0.5*sqrt(abs(x[1] + x[2])), 1.5*x[1] + 0.5*x[2])}, Inputs = c(0.3,900), Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-10, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10){

  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  cat(paste0("The ", Method, " method took ", length(A$Convergence), " iterations and finished with ", A$Finish, "\n"))
  return((A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold))
}

test_that("Testing that each method converges in the quadratic case to within tolerance", {
  expect_true(Test_Of_Convergence(Method = "Anderson")) # This takes 14  iterations.
  expect_true(Test_Of_Convergence(Method = "Simple"))   # This takes 105 iterations.
  expect_true(Test_Of_Convergence(Method = "Aitken"))   # This takes 67  iterations.
  expect_true(Test_Of_Convergence(Method = "Newton"))   # This takes 239 iterations.
  expect_true(Test_Of_Convergence(Method = "VEA"))      # This takes 20  iterations.
  expect_true(Test_Of_Convergence(Method = "SEA"))      # This takes 25  iterations.
  expect_true(Test_Of_Convergence(Method = "MPE"))      # This takes 31  iterations.
  expect_true(Test_Of_Convergence(Method = "RRE"))      # This takes 31  iterations.
})
Function = function(x){c(0.5*sqrt(abs(x[1] + x[2])), 1.5*x[1] + 0.5*x[2])}
Inputs = c(0.3,900)
sqm = SQUAREM::squarem(Inputs,Function, control=list(tol= 1e-10*4 ))
convergence = sum(abs(sqm$par - Function(sqm$par) ))
cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # This takes 44 iterations.

