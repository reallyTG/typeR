library(MBESS)


### Name: ci.reliability
### Title: Confidence Interval for a Reliability Coefficient
### Aliases: ci.reliability
### Keywords: misc htest

### ** Examples

# Use this function for the attitude dataset (ignoring the overall rating variable)
# ci.reliability(data=attitude[,-1], type = "omega", interval.type = "mlrl")

# ci.reliability(data=attitude[,-1], type = "alpha", interval.type = "ll")


## Forming a hypothetical population covariance matrix
# Pop.Cov.Mat <- matrix(.3, 9, 9)
# diag(Pop.Cov.Mat) <- 1
# ci.reliability(S=Pop.Cov.Mat, N=50, type="alpha", interval.type = "bonett")



