library(cmm)


### Name: ModelStatistics
### Title: ModelStatistics
### Aliases: ModelStatistics
### Keywords: univar

### ** Examples


# Below an example where ModelStatistics can be used to get output for coefficients 
# not given by MarginalModelFit 

# Marginal homogeneity (MH) in a 3x3 table AB
# Note that MH is equivalent to independence in the 2x3 table of marginals IR, in which the 
# row with I=1 gives the A marginal, and the row with I=2 gives the B marginal 
n <- 1 : 9
at <- MarginalMatrix(c("A", "B"), list(c("A"), c("B")), c(3,3))
bt <- ConstraintMatrix(c("I", "R"), list(c("I"), c("R")), c(2,3))
model <- list( bt, "log", at)

#The "coefficients" for the model are the log marginal probabilities for table IR
fit <- MarginalModelFit(dat = n, model = model, 
 CoefficientDimensions = c(2, 3), Labels = c("I", "R"))

#to get output for the marginal probabilities, ModelStatistics can be used as follows
spec <-  SpecifyCoefficient("ConditionalProbabilities",list(c("I","R"),c("I"),c(2,3)))
coeff <- list(spec, at)
stats <- ModelStatistics(dat = n, fitfreq = fit$FittedFrequencies, 
 model = model, coeff = coeff, CoefficientDimensions = c(2, 3),
 Labels = c("I", "R"))



