library(reliaR)


### Name: ks.gompertz
### Title: Test of Kolmogorov-Smirnov for the Gompertz distribution
### Aliases: ks.gompertz
### Keywords: htest

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(sys2)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est = 0.00121307, theta.est = 0.00173329

ks.gompertz(sys2, 0.00121307, 0.00173329, alternative = "two.sided", plot = TRUE)



