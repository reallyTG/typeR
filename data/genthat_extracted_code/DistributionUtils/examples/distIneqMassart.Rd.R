library(DistributionUtils)


### Name: distIneqMassart
### Title: Massart Inequality for Distributions
### Aliases: distIneqMassart
### Keywords: distribution univariate

### ** Examples

## Normal distribution is the default
distIneqMassart()
## Specify parameter values
distIneqMassart(mean = 1, sd = 2)
## Gamma distribution has no default value for shape
distIneqMassart("gamma", shape = 1)



