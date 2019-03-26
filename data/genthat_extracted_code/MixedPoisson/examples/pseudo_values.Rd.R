library(MixedPoisson)


### Name: pseudo_values
### Title: Pseudo values - Expectation-Maximization (EM) algorithm
### Aliases: pseudo_values

### ** Examples

variable=rpois(30,4)
pseudo_values(variable, mixing="Gamma", lambda=4, gamma.par=0.7, n=100)


