library(RcppDE)


### Name: DEoptim.control
### Title: Control various aspects of the DEoptim implementation
### Aliases: DEoptim.control
### Keywords: nonlinear optimize

### ** Examples

## set the population size to 20
DEoptim.control(NP = 20)

## set the population size, the number of iterations and don't
## display the iterations during optimization
DEoptim.control(NP = 20, itermax = 100, trace = FALSE)



