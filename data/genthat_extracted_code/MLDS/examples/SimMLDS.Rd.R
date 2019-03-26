library(MLDS)


### Name: SimMLDS
### Title: Simulate Output of MLDS Experiment
### Aliases: SimMLDS
### Keywords: datagen

### ** Examples


Tr <- t(combn(10, 4))
Sc <- seq(0, 1, len = 11)^2
Sig <- 0.2
sim.lst <- SimMLDS(Tr, Sc, Sig, n = 10)
sim.res <- sapply(sim.lst, mlds)





