library(tolerance)


### Name: dpareto.ll
### Title: Maximum Likelihood Estimation for the Discrete Pareto
###   Distribution
### Aliases: dpareto.ll
### Keywords: file

### ** Examples

## Maximum likelihood estimation for randomly generated data
## from the discrete Pareto distribution. 

set.seed(100)

dp.data <- rdpareto(n = 500, theta = 0.2)
out.dp <- dpareto.ll(dp.data)
stats4::coef(out.dp)
stats4::vcov(out.dp)



