library(EMCluster)


### Name: Single Step
### Title: Single E- and M-step
### Aliases: e.step m.step
### Keywords: tool

### ** Examples

library(EMCluster, quietly = TRUE)
x2 <- da2$da

emobj <- list(pi = da2$pi, Mu = da2$Mu, LTSigma = da2$LTSigma)
eobj <- e.step(x2, emobj = emobj)
emobj <- m.step(x2, emobj = eobj)
emobj



