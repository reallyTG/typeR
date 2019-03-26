library(FuzzyStatTra)


### Name: M.estimate
### Title: M-estimator of scale of a trapezoidal fuzzy sample
### Aliases: M.estimate
### Keywords: univar robust

### ** Examples

# Example 1:
F=SimulCASE1(100)
U=Median1norm(F)
est_initial=MDD(F,U,1)
delta=0.5
epsilon=10^(-5)
M.estimate(F,"Huber",est_initial,delta,epsilon,1)



