library(saturnin)


### Name: lweights_gaussian
### Title: Computation of the log-weight matrix in a gaussian setting.
### Aliases: lweights_gaussian
### Keywords: gaussian

### ** Examples

library('saturnin')
data(data_gaussian)

W <- lweights_gaussian(data_gaussian)

prob <- edge.prob(W, log = TRUE)



