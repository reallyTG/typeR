library(FixedPoint)
library(testthat)
library(SQUAREM)
context("Pricing a Perpetual American Put.")

# Consider a perpetual American put option. It never expires unless it is excercised. There is a
# compulsory provision however that the bank buys back the option at price $\chi \geq 0$ if the
# underlying price exceeds $alpha S$ where $\alpha > 1$ and $S$ is the strike price. We will denote
# x to be the current market price, $\sigma$ is the market volatility, $d$ is the risk free rate.

# Each period we discount by $d$.  The underlying price either increases by $e^\sigma$ or decreases
# by a multiple of $e^{-\sigma}$.

d = 0.05
sigma = 0.1
alpha = 2
S = 10
chi = 1

# Given the risk neutral pricing principal the returns from both assets must be equal. Hence we must
# have $pe^{\sigma} + (1-p)e^{-\sigma} = 1+d$
p = (exp(d) - exp(-sigma) ) / (exp(sigma) - exp(-sigma))

# Initially lets guess the value decreases linearly from S (when current price is 0) to 0
# (when current price is \alpha S).
UnderlyingPrices = seq(0,alpha*S, length.out = 100)
OptionPrice = seq(S,chi, length.out = 100)

ValueOfExercise = function(x){max(0,S-x)}
ValueOfHolding = function(x){
  if (x > alpha*S-1e-10){return(chi)}
  IncreasePrice = exp(sigma)*x
  DecreasePrice = exp(-sigma)*x
return((p*EstimatedValueOfOption(IncreasePrice) + (1-p)*EstimatedValueOfOption(DecreasePrice)))
}

ValueOfOption = function(x){
  Holding = ValueOfHolding(x)*exp(-d)
  Exercise = ValueOfExercise(x)
  return(max(Holding, Exercise))
}

IterateOnce = function(OptionPrice){
  EstimatedValueOfOption <<- approxfun(UnderlyingPrices, OptionPrice, rule = 2)
  for (i in 1:length(OptionPrice)){
    OptionPrice[i] = ValueOfOption(UnderlyingPrices[i])
  }
  return(OptionPrice)
}

Test_Of_Convergence = function(Function = IterateOnce, Inputs = OptionPrice, Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-10, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10, DropOldIterates = FALSE){
  A = FixedPoint(Function = Function, Inputs = Inputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig, DropOldIterates = DropOldIterates)
  cat(paste0("The ", Method, " method took ", A$fpevals, " iterations and finished with convergence of ", A$Finish, "\n"))
  return(A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold)
}

test_that("Testing that each method converges in the quadratic case to within tolerance", {
  expect_true(Test_Of_Convergence(Method = "Anderson")) # This takes 37  iterations.
  expect_true(Test_Of_Convergence(Method = "Anderson", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "Simple"))   # This takes 103 iterations.
  expect_true(Test_Of_Convergence(Method = "Simple", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "Aitken"))   # This takes 203 iterations.
  expect_true(Test_Of_Convergence(Method = "Aitken", DropOldIterates = TRUE))
  #expect_true(Test_Of_Convergence(Method = "Newton"))  #  Does not converge
  expect_true(Test_Of_Convergence(Method = "VEA"))      # This takes 108 iterations.
  expect_true(Test_Of_Convergence(Method = "VEA", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "SEA"))      # This takes 103 iterations.
  expect_true(Test_Of_Convergence(Method = "SEA", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "MPE"))      # This takes 43  iterations.
  expect_true(Test_Of_Convergence(Method = "MPE", DropOldIterates = TRUE))
  expect_true(Test_Of_Convergence(Method = "RRE"))      # This takes 52  iterations.
  expect_true(Test_Of_Convergence(Method = "RRE", DropOldIterates = TRUE))
})
Func = IterateOnce
Inputs = OptionPrice
sqm = SQUAREM::squarem(Inputs,Func, control=list(tol= 1e-10*4 ))
convergence = sum(abs(sqm$par - Func(sqm$par) ))
cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # This takes 103 iterations.
