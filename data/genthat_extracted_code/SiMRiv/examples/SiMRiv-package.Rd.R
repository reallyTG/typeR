library(SiMRiv)


### Name: SiMRiv-package
### Title: Simulating Multistate Movements in River/Heterogeneous
###   Landscapes
### Aliases: SiMRiv-package SiMRiv
### Keywords: package

### ** Examples

## a simple Levy-like movement in homogeneous space
## see ?simulate for more complex examples

LevyWalker <- species(
    state.RW() + state.CRW(0.99),
    transitionMatrix(0.005, 0.02))

sim <- simulate(LevyWalker, 20000)
plot(sim, type="l", asp=1)



