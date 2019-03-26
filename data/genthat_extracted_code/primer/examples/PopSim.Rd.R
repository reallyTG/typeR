library(primer)


### Name: PopSim
### Title: Population Simulator
### Aliases: PopSim
### Keywords: methods

### ** Examples

lambdas <- runif(10, .5, 1.5)
out <- PopSim(Rs=lambdas, years=50, N0=50)
matplot(0:50, out, type='l')
summary(out[51,])



