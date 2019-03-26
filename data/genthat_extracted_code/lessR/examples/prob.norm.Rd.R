library(lessR)


### Name: prob.norm
### Title: Compute and Plot Normal Curve Probabilities over an Interval
### Aliases: prob.norm
### Keywords: probability

### ** Examples

# Mu=0, Sigma=1: Standard normal prob, values between 0 and 2
prob.norm(0,2)

# Mu=0, Sigma=1: Standard normal prob, values lower than 2
prob.norm(hi=2)

# Mu=0, Sigma=1: Standard normal prob, values larger than 2
prob.norm(lo=2)

# Mu=100, Sigma=15: Change default fill color of plotted interval
prob.norm(lo=115, hi=125, mu=100, sigma=15, fill.int="plum")



