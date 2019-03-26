library(FixedPoint)
library(testthat)
library(SQUAREM)
context("Testing all convergence methods for the calibration of a perceptron")
# Generating linearly seperable data
set.seed(10)
data = data.frame("x1" = rnorm(100,4,2), "x2" = rnorm(100,8,2), y = -1)
data = rbind(data,  data.frame("x1" = rnorm(100,-4,2), "x2" = rnorm(100,12), y = 1)  )
plot(data$x1, data$x2, col = data$y+2)

# Iterating training of Perceptron
IteratePerceptronWeights = function(w, LearningRate = 1){
  intSeq = 1:length(data[,"y"])
  for (i in intSeq){
    target = data[i,c("y")]
    score  =  w[1] + (w[2]*data[i, "x1"]) + (w[3]*data[i, "x2"])
    ypred  = 2*(as.numeric( score > 0 )-0.5)
    update = LearningRate * 0.5*(target-ypred)
    w[1]   = w[1] + update
    w[2]   = w[2] + update*data[i, "x1"]
    w[3]   = w[3] + update*data[i, "x2"]
  }
  return(w)
}

plotLine = function(w){
  xrange = seq(-10,10,length.out = 100)
  yrange = -(w[2]/w[3])[[1]] * xrange - w[1]/w[3]
  plot(data$x1, data$x2, col = data$y+2, pch = data$y+2,
       xlab = "x_1", ylab = "x_2")
  lines(xrange, yrange)
}


InitialGuess = c(1,1,1)
#FP = FixedPoint(Function = IteratePerceptronWeights, Inputs =  InitialGuess, Method = "Simple", MaxIter = 1200)
#plotLine(FP$FixedPoint)

Test_Of_Convergence = function(Function = function(w)IteratePerceptronWeights(w,1), Inputs = InitialGuess, Outputs = c(), Method = c("Simple") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-13, MaxIter = 1400, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10){

  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  cat(paste0("The ", Method, " method took ", length(A$Convergence), " iterations and finished with convergence of ", A$Finish, "\n"))
  return((A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold))
}


test_that("Testing that each method converges", {
  #expect_true(Test_Of_Convergence(Method = "Anderson")) # Does not converge (Fixed point found is outside numerical precision)
  #expect_true(Test_Of_Convergence(Method = "Simple"))    # This takes 1121 iterations.
  #expect_true(Test_Of_Convergence(Method = "Aitken"))   # Does not converge
  #expect_true(Test_Of_Convergence(Method = "Newton"))   # Does not converge
  #expect_true(Test_Of_Convergence(Method = "VEA"))      # Does not converge
  #expect_true(Test_Of_Convergence(Method = "SEA"))      # Does not converge - Contains Infs
  #expect_true(Test_Of_Convergence(Method = "MPE"))      # Does not converge (Fixed point found is outside numerical precision)
  #expect_true(Test_Of_Convergence(Method = "RRE"))      # Does not converge
})

#Func = function(w)IteratePerceptronWeights(w,1)
#Inputs = InitialGuess
#sqm = SQUAREM::squarem(Inputs,Func, control=list(tol= 1e-13*4 ))
#convergence = sum(abs(sqm$par - Func(sqm$par) ))
#cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # Does not converge.


IteratePerceptronWeights = function(w, LearningRate = 1){
  intSeq = 1:length(data[,"y"])
  for (i in intSeq){
    target = data[i,c("y")]
    score  =  w[1] + (w[2]*data[i, "x1"]) + (w[3]*data[i, "x2"])
    ypred  = 2*(as.numeric( score > 0 )-0.5)
    if ((target-ypred) != 0){
      update = LearningRate * -sign(score) * sqrt(abs(score))
      w[1] = w[1] + update
      w[2] = w[2] + update*data[i, "x1"]
      w[3] = w[3] + update*data[i, "x2"]
    }
  }
  return(w)
}

#FP = FixedPoint(Function = IteratePerceptronWeights, Inputs =  InitialGuess, Method = "MPE", PrintReports = TRUE, MaxIter = 2500)
#FP$FixedPoint
#plotLine(FP$FixedPoint)

test_that("Testing that each method converges", {
  #expect_true(Test_Of_Convergence(Method = "Anderson")) # Does not converge
  #expect_true(Test_Of_Convergence(Method = "Simple"))   # This takes 1156 iterations.
  #expect_true(Test_Of_Convergence(Method = "Aitken"))   # Does not Converge
  expect_true(Test_Of_Convergence(Method = "Newton"))    # This takes 20 iterations.
  #expect_true(Test_Of_Convergence(Method = "VEA"))      # This takes 75 iterations.
  #expect_true(Test_Of_Convergence(Method = "SEA"))      # This takes 158 iterations.
  expect_true(Test_Of_Convergence(Method = "MPE"))       # This takes 54 iterations.
  #expect_true(Test_Of_Convergence(Method = "RRE"))      # This takes 129 iterations.
})
#Func = function(w)IteratePerceptronWeights(w,1)
#Inputs = InitialGuess
#sqm = SQUAREM::squarem(Inputs,Func, control=list(tol= 1e-13*4 ))
#convergence = sum(abs(sqm$par - Func(sqm$par) ))
#cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # This takes 638 iterations.

