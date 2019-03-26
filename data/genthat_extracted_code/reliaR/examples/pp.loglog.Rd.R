library(reliaR)


### Name: pp.loglog
### Title: Probability versus Probability (PP) plot for the Loglog
###   distribution
### Aliases: pp.loglog
### Keywords: hplot

### ** Examples

## Load data sets.
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.9058689 lambda.est = 1.0028228

pp.loglog(sys2, 0.9058689, 1.0028228, line = TRUE)



