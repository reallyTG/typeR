library(saturnin)


### Name: weights_gausscopula
### Title: Computation of the weight matrix in a gaussian copula setting.
### Aliases: weights_gausscopula
### Keywords: gaussian copula

### ** Examples

library('saturnin')
data(data_multinomial)

W <- weights_gausscopula(data_multinomial)

prob <- edge.prob(W, log = FALSE)



