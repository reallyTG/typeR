library(distrEx)


### Name: ConvexContamination
### Title: Generic Function for Generating Convex Contaminations
### Aliases: ConvexContamination ConvexContamination-methods
###   ConvexContamination,UnivariateDistribution,UnivariateDistribution,numeric-method
###   ConvexContamination,AbscontDistribution,AbscontDistribution,numeric-method
###   ConvexContamination,AbscontDistribution,UnivariateDistribution,numeric-method
###   ConvexContamination,DiscreteDistribution,DiscreteDistribution,numeric-method
###   ConvexContamination,LatticeDistribution,DiscreteDistribution,numeric-method
###   ConvexContamination,DiscreteDistribution,LatticeDistribution,numeric-method
###   ConvexContamination,LatticeDistribution,LatticeDistribution,numeric-method
###   ConvexContamination,AcDcLcDistribution,AcDcLcDistribution,numeric-method
### Keywords: distribution methods

### ** Examples

# Convex combination of two normal distributions
C1 <- ConvexContamination(e1 = Norm(), e2 = Norm(mean = 5), size = 0.1)
plot(C1)



