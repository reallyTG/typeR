library(FixedPoint)
library(testthat)
library(SQUAREM)
context("Testing all convergence methods for an equilibrium price vector problem.")

# Consider that there are N households in a pure exchange economy. Every household has identical
# preferences over G types of good given by. Household $n$ has a utility function of
# $U_n = \sum_{i=1}^G \gamma_{n,i} \log(c_{n,i})$
# Where $\gamma_{n,i}$ is a parameter describing household $n$'s taste for good $i$, $c_{n,i}$ is
# household $n$'s consumption of good $i$.
# Each household is endowed with an amount of each good. They can then trade goods before consumption.
# We want to find the equilibrium prices in this exchange economy.


# Generating data
set.seed(3112)
N = 8
G = 10
Endowments = matrix(rlnorm(N*G), nrow = G)
Gamma      = matrix(runif(N*G), nrow = G)
# Every column here represents a household and every row is a good. So Endowments[1,2] is the second
# households endowment of good 1.

# We will choose good 1 as the numeraire. So $P_1 = 1$. Now we need to come up with a function who's
# fixed point is an equilibrium pricing vector. Equilbrium occurs when there is zero excess demand or
# supply. So we will first find an expression for demand given a price vector. Setting up the lagrangian:
# $L = \sum_{i=1}^G \gamma_{n,i} \log(c_{n,i}) + \lambda_{n}[ \sum_{i=1}^G p_i(e_{n,i}-c_{n,i}) ]$
# Where $\lambda_{n}$ is household $n$'s shadow price and $e_{n,i}$ is this household's endowment of
# good $i$ and $p_i$ is the price of good $i$. Taking FOC with respect to $c_i$ of this lagrangian yields:
# $c_{n,i} = \frac{\gamma_{n,i}}{p_i \lambda_n}$
# and taking FOC condition with respect to $\lambda_n$ yields the budget constraint. Subbing the above
# equation into the budget constrain and rearranging yields:
# $\lambda_n = \frac{\sum^G_{i=1} \gamma_{n,i}}{\sum^G_{i=1} p_i e_{n,i}}$
# We can also sum over households to find total demand for each good as:
# $D_i = \frac{1}{P_i} \sum_{n=1}^G \frac{\gamma_{n,i}}{\lambda_n}$
# We will find the equilibrium price vector by using an approximate price vector to find $lambda$s. We
# can then find an estimate of the equilibrium price P_i which solves $D_i = \sum_{n=1}^G e_{n,i}$:
# P_i = \frac{\sum_{n=1}^G e_{n,i}}{\sum_{n=1}^G \frac{\gamma_{n,i}}{\lambda_n} }$

TotalEndowmentsPerGood = apply(Endowments, 1, sum)
TotalGammasPerHousehold = apply(Gamma, 2, sum)
LambdasGivenPriceVector = function(Price){
  ValueOfEndowmentsPerHousehold = Price * Endowments
  TotalValueOfEndowmentsPerHousehold = apply(ValueOfEndowmentsPerHousehold, 2, sum)
  return(TotalGammasPerHousehold /TotalValueOfEndowmentsPerHousehold)
}

IterateOnce = function(Price){
  Lambdas = LambdasGivenPriceVector(Price)
  GammaOverLambdas = t(apply(Gamma, 1, function(x) x / Lambdas))
  SumGammaOverLambdas = apply(GammaOverLambdas,1,sum)
  NewPrices = SumGammaOverLambdas/ TotalEndowmentsPerGood
  NewPrices = NewPrices/NewPrices[1]
  return(NewPrices)
}


InitialGuess = rep(1,10)
Test_Of_Convergence = function(Function = IterateOnce, Inputs = InitialGuess, Outputs = c(), Method = c("Newton") , ConvergenceMetric  = function(Resids){max(abs(Resids))} , ConvergenceMetricThreshold = 1e-13, MaxIter = 1e3, MaxM = 10, Dampening = 1, PrintReports = FALSE, ReportingSigFig = 5, ConditionNumberThreshold = 1e10){

  A = FixedPoint(Function = Function, Inputs = Inputs, Outputs = Outputs, Method = Method, ConvergenceMetric = ConvergenceMetric, ConvergenceMetricThreshold = ConvergenceMetricThreshold, MaxIter = MaxIter, MaxM = MaxM, Dampening = Dampening, PrintReports = PrintReports, ReportingSigFig = ReportingSigFig)
  cat(paste0("The ", Method, " method took ", length(A$Convergence), " iterations and finished with ", A$Finish, "\n"))
  return((A$Convergence[length(A$Convergence)] < ConvergenceMetricThreshold))
}

test_that("Testing that each method converges in the equilibrium price vector case to within tolerance", {
  expect_true(Test_Of_Convergence(Method = "Anderson")) # This takes 9  iterations.
  expect_true(Test_Of_Convergence(Method = "Simple"))   # This takes 11 iterations.
  expect_true(Test_Of_Convergence(Method = "Aitken"))   # This takes 14 iterations.
  expect_true(Test_Of_Convergence(Method = "Newton"))   # This takes 24 iterations.
  expect_true(Test_Of_Convergence(Method = "VEA"))      # This takes 11 iterations.
  expect_true(Test_Of_Convergence(Method = "SEA"))      # This takes 11 iterations.
  expect_true(Test_Of_Convergence(Method = "MPE"))      # This takes 11 iterations.
  expect_true(Test_Of_Convergence(Method = "RRE"))      # This takes 12 iterations.
})
Func = IterateOnce
Inputs = InitialGuess
sqm = SQUAREM::squarem(Inputs,Func, control=list(tol= 1e-13*4 ))
convergence = sum(abs(sqm$par - Func(sqm$par) ))
cat(paste0("The squarem method took ", sqm$fpevals, " iterations and finished with convergence of ", convergence, "\n")) # This takes 11 iterations.

