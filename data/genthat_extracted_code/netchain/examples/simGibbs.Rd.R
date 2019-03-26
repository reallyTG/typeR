library(netchain)


### Name: simGibbs
### Title: Generate binary (*Y*, *A*, *C*) from chain graph model under
###   simplest scenario.
### Aliases: simGibbs

### ** Examples

library(netchain)
weight.matrix <- matrix(c(0.5, 1, 0, 1, 0.3, 0.5, 0, 0.5, -0.5), 3, 3)
simobs <- simGibbs(n.unit = 3, n.gibbs = 200, n.sample = 10, 
                  weight.matrix,
                  treat.matrix = 0.5*diag(3), cov.matrix= (-0.3)*diag(3) )
inputY <- simobs$inputY
inputA <- simobs$inputA
inputC <- simobs$inputC




