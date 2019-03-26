library(evdbayes)


### Name: prior
### Title: Construction of Prior Distributions
### Aliases: prior.prob prior.quant prior.norm prior.loglognorm
### Keywords: models

### ** Examples

mat <- diag(c(10000, 10000, 100))
prior.norm(mean = c(0,0,0), cov = mat, trendsd = 10)
prior.quant(shape = c(38.9,7.1,47), scale = c(1.5,6.3,2.6))
prior.prob(quant = c(85,88,95), alpha = c(4,2.5,2.25,0.25))



