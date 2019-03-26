library(RobRex)


### Name: rgsOptIC.AL
### Title: Computation of the optimally robust IC for AL estimators
### Aliases: rgsOptIC.AL
### Keywords: robust

### ** Examples

K <- DiscreteDistribution(1:5) # = Unif({1,2,3,4,5})
IC1 <- rgsOptIC.AL(r = 0.1, K = K)
checkIC(IC1)
Risks(IC1)
cent(IC1)
clip(IC1)
stand(IC1)



