library(RobRex)


### Name: rgsOptIC.ALc
### Title: Computation of the optimally robust IC for AL estimators
### Aliases: rgsOptIC.ALc
### Keywords: robust

### ** Examples

## don't test to reduce check time
## No test: 
K <- DiscreteDistribution(1:5) # = Unif({1,2,3,4,5})
IC1 <- rgsOptIC.ALc(r = 0.1, K = K)
checkIC(IC1)
Risks(IC1)
## End(No test)



