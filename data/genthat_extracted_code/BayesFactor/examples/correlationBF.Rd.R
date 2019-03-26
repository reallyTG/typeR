library(BayesFactor)


### Name: correlationBF
### Title: Function for Bayesian analysis of correlations
### Aliases: correlationBF
### Keywords: htest

### ** Examples

bf = correlationBF(y = iris$Sepal.Length, x = iris$Sepal.Width)
bf
## Sample from the corresponding posterior distribution
samples = correlationBF(y = iris$Sepal.Length, x = iris$Sepal.Width,
          posterior = TRUE, iterations = 10000)
plot(samples[,"rho"])



