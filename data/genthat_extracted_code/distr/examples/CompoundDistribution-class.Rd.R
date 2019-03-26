library(distr)


### Name: CompoundDistribution-class
### Title: Class "CompoundDistribution"
### Aliases: CompoundDistribution-class NumbOfSummandsDistr SummandsDistr
###   NumbOfSummandsDistr-methods SummandsDistr-methods
###   NumbOfSummandsDistr,CompoundDistribution-method
###   SummandsDistr,CompoundDistribution-method
###   coerce,CompoundDistribution,UnivarLebDecDistribution-method
###   UnivDistrListOrDistribution-class
### Keywords: distribution

### ** Examples

CP <- CompoundDistribution(Pois(),Norm())
CP
p(CP)(0.3)          
plot(CP)



