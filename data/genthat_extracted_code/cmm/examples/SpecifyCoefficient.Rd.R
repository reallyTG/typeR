library(cmm)


### Name: SpecifyCoefficient
### Title: SpecifyCoefficient
### Aliases: SpecifyCoefficient
### Keywords: univar

### ** Examples

   SpecifyCoefficient("Mean",arg = c(1,2,3))
   SpecifyCoefficient("Variance",arg = c(1,2,3))
   SpecifyCoefficient("StandardDeviation",arg = c(1,2,3))
   SpecifyCoefficient("GiniMeanDifference",arg = c(1,2,3))
   SpecifyCoefficient("Entropy",arg = 5)
   SpecifyCoefficient("DiversityIndex",arg = 5)
   SpecifyCoefficient("Covariance",arg = list(c(1,2,3),c(1,2,3)))
   SpecifyCoefficient("Correlation",arg = list(c(1,2,3),c(1,2,3)))
   SpecifyCoefficient("KendallTau",arg = list(3,4))
   SpecifyCoefficient("GoodmanKruskalGammma",arg = list(3,4))
   SpecifyCoefficient("CohenKappa",arg = 3)
   SpecifyCoefficient("DifferenceInProportions",arg = 1)
   SpecifyCoefficient("LogOddsRatio",arg = 1)
   SpecifyCoefficient("LoglinearParameters",arg = c(3,3))
   SpecifyCoefficient("Probabilities",arg = 8)
   SpecifyCoefficient("LogProbabilities",arg = 8)
   # conditional probabilities for 3x3 table, conditioning on first variable
   SpecifyCoefficient("ConditionalProbabilities",arg = list(c(1,2),c(1),c(3,3)))



