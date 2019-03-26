library(FDRSeg)


### Name: evalStepFun
### Title: Evaluate step function
### Aliases: evalStepFun
### Keywords: nonparametric

### ** Examples

# simulate data
set.seed(2)
u0 <- c(rep(1, 5), rep(5, 5))
Y  <- rnorm(10, u0)

# compute the SMUCE estimate
uh <- smuce(Y)

# print results
#   step function returned by smuce
print(uh)
#   vector returned by evalStepFun
print(evalStepFun(uh))



