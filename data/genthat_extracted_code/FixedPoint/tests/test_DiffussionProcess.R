library(FixedPoint)
library(testthat)
library(SQUAREM)
context("Testing three convergence methods for a gas diffusion problem.")

# We have squares as described in below matrix.
# The top right corner is 1 the bottom right corner is SideDivision^2
# The oxygen is being released at 1. The nitrogen is being released at SideDivision^2.
# We will model equilibrium as occuring when each square has gas concentration equal to the average of
# itself with its contiguous squares. Each corner square has two contiguous squares, each perimeter square
# borders three and each interiour square borders four.

SideDivision = 10
Numbering = matrix(seq(1,SideDivision^2,1), SideDivision)

NeighbourSquares = function(n,SideDivision){
  SurroundingIndexes = c(n)
  if (n %% SideDivision != 1){SurroundingIndexes = c(SurroundingIndexes, n-1)} # above
  if (n %% SideDivision != 0){SurroundingIndexes = c(SurroundingIndexes, n+1)} # below
  if (n > SideDivision){SurroundingIndexes = c(SurroundingIndexes, n- SideDivision)} # right
  if (n <= SideDivision^2-SideDivision){SurroundingIndexes = c(SurroundingIndexes, n+ SideDivision)} # left
  return(SurroundingIndexes)
}

TwoDimensionalDiffusionIteration = function(x, SideDivision){
  xnew = x
  for (i in 1:(SideDivision^2)){
    Subset = NeighbourSquares(i, SideDivision)
    xnew[i] = mean(x[Subset])
  }
  xnew[1] = 1
  xnew[SideDivision^2] = 0
  return(xnew)
}

StartVector = c(rep(0,50), rep(1,50))
Test_Of_Convergence = function(Inputs = StartVector, Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-4, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10){

  Func = function(x){TwoDimensionalDiffusionIteration(x, SideDivision)}

  A = FixedPoint(Function = Func, Inputs = Inputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  cat(paste0("The ", Method, " method took ", length(A$Convergence), " iterations and finished with ", A$Finish, "\n"))
  return(list(Convergence = A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold, Result = A))
}

test_that("Testing that each method converges in the quadratic case to within tolerance", {
  expect_true(Test_Of_Convergence(Method = "Anderson")$Convergence)  # This takes 26  iterations.
  #expect_true(Test_Of_Convergence(Method = "Simple")$Convergence)   # This takes 221 iterations and will not normally be run
  #expect_true(Test_Of_Convergence(Method = "Aitken")$Convergence)   # This takes 323 iterations and will not normally be run
  #expect_true(Test_Of_Convergence(Method = "Newton")$Convergence)   # Does not converge
  #expect_true(Test_Of_Convergence(Method = "VEA")$Convergence)      # This takes 150 iterations and will not normally be run
  #expect_true(Test_Of_Convergence(Method = "SEA")$Convergence)      # This takes 221 iterations and will not normally be run
  #expect_true(Test_Of_Convergence(Method = "MPE")$Convergence)      # This takes 44  iterations and will not normally be run
  #expect_true(Test_Of_Convergence(Method = "RRE")$Convergence)      # This takes 50  iterations and will not normally be run
})
Func = function(x){TwoDimensionalDiffusionIteration(x, SideDivision)}
#sqm = SQUAREM::squarem(StartVector,Func, control=list(tol= 1e-4*4 ))
#convergence = sum(abs(sqm$par - Func(sqm$par) ))
#cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # This takes 158 iterations and will not normally by run.


#To visualise final result:
#A = FixedPoint(Function = Func, Inputs = StartVector, Method = "Anderson")
#Numbering = matrix(A$FixedPoint, SideDivision)



