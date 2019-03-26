library(StatRank)


### Name: Likelihood.Nonparametric
### Title: Calculate Likelihood for the nonparametric model
### Aliases: Likelihood.Nonparametric

### ** Examples

data(Data.Test)
Estimate <- Estimation.RUM.Nonparametric(Data.Test, m = 5, iter = 3)
Likelihood.Nonparametric(Data.Test, Estimate)



