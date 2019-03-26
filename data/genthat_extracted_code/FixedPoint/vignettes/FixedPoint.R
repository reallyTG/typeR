## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
library(FixedPoint)
SequenceFunction = function(tn){0.5*(tn + 100/tn)}

FP_Simple   = FixedPoint(Function=SequenceFunction,Inputs = 6,  Method = "Simple")

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
NumbersVector = 1:100
SequenceFunction = function(tn){0.5*(tn + NumbersVector/tn)}
FP_SEA   = FixedPoint(Function = SequenceFunction, Inputs = 1:100,  Method = "RRE")

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
SimpleVectorFunction = function(x){c(0.5*sqrt(abs(x[1] + x[2])), 1.5*x[1] + 0.5*x[2])}
FP_Simple = FixedPoint(Function = SimpleVectorFunction, Inputs = c(0.3,900), Method = "Simple")
FP_Anderson = FixedPoint(Function = SimpleVectorFunction, Inputs = c(0.3,900), Method = "Anderson")

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
Run1 = FixedPoint(Function = function(x){x^0.2}, Inputs = c(0.3, 0.4,0.5),
                Method = "Aitken")
cat(paste("Running this all at once takes ", length(Run1$Convergence), " iterations and 
          convergences to ",  Run1$Convergence[length(Run1$Convergence)], "\n"))

Run2_1 = FixedPoint(Function = function(x){x^0.2}, Inputs = c(0.3, 0.4,0.5),
                Method = "Aitken", MaxIter = 4)
# Check some condition about the convergence or change algorithm.
Run2_2 = FixedPoint(Function = function(x){x^0.2}, Inputs = Run2_1$Inputs, 
                    Outputs = Run2_1$Outputs, Method = "Aitken")
cat(paste("Running this with a break takes ", length(Run2_2$Convergence), " iterations and 
          convergences to ",  Run2_2$Convergence[length(Run2_2$Convergence)], "\n"))

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
StretchFactor = c(1,1.1,1.2,3,3.3,3.6,7,8,9,15, 20)

FPFunction = function(x){
  for (i in 1:length(x)){
  x[i] = log(StretchFactor[i]*max(10,x[i]+10))
  }
  return(x)
}
FPSolution  = FixedPoint(Function = FPFunction, Inputs = 1:11,  MaxIter = 8, Method = "Aitken")

# This shows convergence on the y axis and iterates on the x axis.
ConvergenceFig(FPSolution$Inputs, FPSolution$Outputs, FPSolution$Convergence)
# This shows the value of each vector entry on the y axis and vector index on the x axis.
ChangePerIterate(FPSolution$Inputs, FPSolution$Outputs, FPSolution$Convergence, 
                 FromIterate = 2, ToIterate = 2, secondhold = -1)
# Sometimes there is something more meaningful than the vector index to put on the x axis
# in the ChangePerIterate plot. The consumer's budget in the consumption smoothing case 
# is a good example. In these cases we can add them to the xaxis argument of the function.
# For instance we can add xaxis = StretchFactor in this case and we get the third figure 
# below:
ChangePerIterate(FPSolution$Inputs, FPSolution$Outputs, FPSolution$Convergence,
                 FromIterate = 2, ToIterate = 2, secondhold = -1, xaxis = StretchFactor)


## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
SimpleVectorFunction = function(x){c(0.5*sqrt(x[1] + x[2]), 1.5*x[1] + 0.5*x[2])}
FPSolution = FixedPoint(Function = SimpleVectorFunction, Inputs = c(0.3,900),
                        Method = "Anderson")
# We can see the output of the FixedPoint function in cases like this where it ends due
# to an error
FPSolution


# We can use this information to decide to switch to the simple method.
# No error results as the simple method doesn't extrapolate.
FPSolution = FixedPoint(Function = SimpleVectorFunction, Inputs = FPSolution$Inputs, 
                        Outputs = FPSolution$Outputs, Method = "Simple", MaxIter = 5)
# Now we switch to the Anderson Method again. No error results because we are
# close to fixed point.
FPSolution = FixedPoint(Function = SimpleVectorFunction, Inputs = FPSolution$Inputs,
                        Outputs = FPSolution$Outputs, Method = "Anderson")

## ---- fig.show='hold', fig.width=10, fig.height=4.5----------------------
phi = 10
Numbering = matrix(seq(1,phi^2,1), phi) # Numbering scheme for squares.

NeighbourSquares = function(n,phi){
  SurroundingIndexes = c(n)
  if (n %% phi != 1){SurroundingIndexes = c(SurroundingIndexes, n-1)} # above
  if (n %% phi != 0){SurroundingIndexes = c(SurroundingIndexes, n+1)} # below
  if (n > phi){SurroundingIndexes = c(SurroundingIndexes, n- phi)} # right
  if (n <= phi^2-phi){SurroundingIndexes = c(SurroundingIndexes, n+ phi)} # left
  return(SurroundingIndexes)
}

TwoDimensionalDiffusionIteration = function(x, phi){
  xnew = x
  for (i in 1:(phi^2)){
    Subset = NeighbourSquares(i, phi)
    xnew[i] = mean(x[Subset])
  }
  xnew[1] = 1
  xnew[phi^2] = 0
  return(xnew)
}

FPSolution = FixedPoint(Function = function(x) TwoDimensionalDiffusionIteration(x, phi),
               Inputs =  c(rep(0,50), rep(1,50)), Method = "RRE")


## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
# Generating data
set.seed(3112)
N = 8
G = 10
Endowments = matrix(rlnorm(N*G), nrow = G)
Gamma      = matrix(runif(N*G), nrow = G)
# Every column here represents a household and every row is a good. So Endowments[1,2] is
# the second household's endowment of good 1.

# We now start solving for equilibrium prices:
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
FPSolution = FixedPoint(Function = IterateOnce, Inputs =  InitialGuess, Method = "VEA")

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
# Generating linearly seperable data
set.seed(10)
data = data.frame("x1" = rnorm(10,4,2), "x2" = rnorm(10,8,2), y = -1)
data = rbind(data,  data.frame("x1" = rnorm(10,-4,2), "x2" = rnorm(10,12), y = 1)  )

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
  plot(data$x1, data$x2, col = data$y+2)
  lines(xrange, yrange)
}


InitialGuess = c(1,1,1)
FP = FixedPoint(Function = IteratePerceptronWeights, Inputs =  InitialGuess,
                Method = "Simple", MaxIter = 1200)
plotLine(FP$FixedPoint)

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
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

FP = FixedPoint(Function = IteratePerceptronWeights, Inputs =  InitialGuess, Method = "MPE")

## ---- fig.show='hold', fig.width=10, fig.height=4.5----------------------
d = 0.05
sigma = 0.1
alpha = 4
S = 10
chi = 0
p = (exp(d) - exp(-sigma) ) / (exp(sigma) - exp(-sigma))

# Initially lets guess the value decreases linearly from S (when current price is 0) to
# chi (when the current price is alpha*S).
UnderlyingPrices = seq(0,alpha*S, length.out = 100)
OptionPrice = seq(S,chi, length.out = 100)

ValueOfExercise = function(x){max(0,S-x)}
ValueOfHolding = function(x){
  if (x > alpha*S-1e-10){return(chi)}
  IncreasePrice = exp(sigma)*x
  DecreasePrice = exp(-sigma)*x
return((p*EstimatedValueOfOption(IncreasePrice) +
          (1-p)*EstimatedValueOfOption(DecreasePrice)))
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


# This can be run sequentially with the following algorithm.
FPSolution = FixedPoint(Function = IterateOnce, Inputs = OptionPrice, Method = "MPE")

## ---- fig.show='hold', fig.width=10, fig.height=4.5----------------------
library(FixedPoint)
library(schumaker)
library(cubature)
delta = 0.2
beta = 0.8
BudgetStateSpace = c(seq(0,1, 0.05), seq(1.10,3,0.1))
InitialGuess = sqrt(BudgetStateSpace)

ValueGivenShock = function(Budget, epsilon, NextValueFunction){
  optimize(f = function(x) epsilon*(x^delta) + beta*NextValueFunction(Budget - x + 1), 
           lower = 0, upper = Budget, maximum = TRUE)$objective
}

ExpectedUtility = function(Budget, NextValueFunction){
  if (Budget > 0.001){
  adaptIntegrate(f = function(epsilon) ValueGivenShock(Budget, epsilon, 
                                                       NextValueFunction)* dlnorm(epsilon),
                                                       lowerLimit = qlnorm(0.0001), 
                                                       upperLimit =qlnorm(0.9999))$integral
  } else {
    beta*NextValueFunction(1)
  }
}

IterateOnce = function(BudgetValues){
  NextValueFunction = schumaker::Schumaker(BudgetStateSpace, BudgetValues,
                                           Extrapolation = "Linear")$Spline
  for (i in 1:length(BudgetStateSpace)){# This is often a good loop to parallelise.
    BudgetValues[i] = ExpectedUtility(BudgetStateSpace[i], NextValueFunction)
  }
  return(BudgetValues)
}
FPSolution = FixedPoint(Function = IterateOnce,Inputs = InitialGuess,Method = c("Anderson"))


## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
library(foreach)
library(doParallel)

TaskAssigner = function(Inputs, Outputs, i, Function){
  library(FixedPoint) 
  library(schumaker)
  library(cubature)
  Iterates = dim(Inputs)[2]
  if (i == 2) {IterateToDrop = Iterates-1} else {IterateToDrop = 0}
  IteratesToUse = (1:Iterates)[ 1:Iterates != IterateToDrop]
  Inputs = matrix(Inputs[,IteratesToUse], ncol = length(IteratesToUse), byrow = FALSE)
  Outputs = matrix(Outputs[,IteratesToUse], ncol = length(IteratesToUse), byrow = FALSE)
  Guess = FixedPointNewInput(Inputs = Inputs, Outputs = Outputs, Method = "Anderson")
  Outputs = matrix(Function(Guess), ncol = 1, byrow = FALSE)
  Inputs = matrix(Guess, ncol = 1, byrow = FALSE)

  return(list(Inputs = Inputs, Outputs = Outputs))
}

CombineLists = function(List1, List2){
  width = dim(List1$Inputs)[2] + dim(List2$Inputs)[2]
  C = list()
  C$Inputs  = matrix(c(List1$Inputs , List2$Inputs ), ncol = width, byrow = FALSE)
  C$Outputs = matrix(c(List1$Outputs, List2$Outputs), ncol = width, byrow = FALSE)
  return(C)
}

# ReSortIterations
# This function takes the previous inputs and outputs from the function and removes
# duplicates and then sorts them into a different order.
ReSortIterations = function(PreviousIterates, 
                            ConvergenceMetric = function(Resids){max(abs(Resids))})
{
  # Removing any duplicates  
  NotDuplicated   = (!(duplicated.matrix(PreviousIterates$Inputs, MARGIN = 2)))
  PreviousIterates$Inputs  = PreviousIterates$Inputs[,NotDuplicated]
  PreviousIterates$Outputs = PreviousIterates$Outputs[,NotDuplicated]
  # Resorting
  Resid       = PreviousIterates$Outputs - PreviousIterates$Inputs
  Convergence =   ConvergenceVector = sapply(1:(dim(Resid)[2]), function(x)
    ConvergenceMetric(Resid[,x]) )
  Reordering  =   order(Convergence, decreasing = TRUE)
  PreviousIterates$Inputs  = PreviousIterates$Inputs[,Reordering]
  PreviousIterates$Outputs = PreviousIterates$Outputs[,Reordering]
  return(PreviousIterates)
}


ConvergenceMetric = function(Resid){max(abs(Resid))}

# Preparing for clustering and getting a few runs to input to later functions:
PreviousRuns = FixedPoint(Function = IterateOnce, Inputs = InitialGuess,
                          Method = "Anderson", MaxIter = 2)
PreviousRuns$Residuals = PreviousRuns$Outputs - PreviousRuns$Inputs
PreviousRuns$Convergence = apply(PreviousRuns$Residuals , 2, ConvergenceMetric )
ConvergenceVal = min(PreviousRuns$Convergence)

registerDoParallel(cores=2)

iter = 2
while (iter < 100 & ConvergenceVal > 1e-10){
  NewRuns = foreach(i = 1:2, .combine=CombineLists) %dopar% {
    TaskAssigner(PreviousRuns$Inputs, PreviousRuns$Outputs, i, IterateOnce)
  }
  # Appending to previous runs
  PreviousRuns$Inputs = matrix(c(PreviousRuns$Inputs , NewRuns$Inputs ), 
                               ncol = dim(PreviousRuns$Inputs)[2] + 2, byrow = FALSE)
  PreviousRuns$Outputs = matrix(c(PreviousRuns$Outputs , NewRuns$Outputs ), 
                                ncol = dim(PreviousRuns$Outputs)[2] + 2, byrow = FALSE)
  PreviousRuns = ReSortIterations(PreviousRuns)
  PreviousRuns$Residuals = PreviousRuns$Outputs - PreviousRuns$Inputs
  PreviousRuns$Convergence = apply(PreviousRuns$Residuals , 2, ConvergenceMetric )
  # Finding Convergence
  ConvergenceVal = min(PreviousRuns$Convergence)
  iter = iter+2
}

stopImplicitCluster()

PreviousRuns$FixedPoint = PreviousRuns$Outputs[, dim(PreviousRuns$Outputs)[2]]


