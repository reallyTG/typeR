library(tolerance)


### Name: poislind.ll
### Title: Maximum Likelihood Estimation for the Discrete Poisson-Lindley
###   Distribution
### Aliases: poislind.ll
### Keywords: file

### ** Examples

## Maximum likelihood estimation for randomly generated data
## from the Poisson-Lindley distribution. 

set.seed(100)

pl.data <- rpoislind(n = 500, theta = 0.5)
out.pl <- poislind.ll(pl.data)
stats4::coef(out.pl)
stats4::vcov(out.pl)



