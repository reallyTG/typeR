library(reliaR)


### Name: ks.loglog
### Title: Test of Kolmogorov-Smirnov for the Loglog distribution
### Aliases: ks.loglog
### Keywords: htest

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.9058689 lambda.est = 1.0028228

ks.loglog(sys2, 0.9058689, 1.0028228, alternative = "two.sided", plot = TRUE)  



