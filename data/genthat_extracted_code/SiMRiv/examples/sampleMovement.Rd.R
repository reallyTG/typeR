library(SiMRiv)


### Name: sampleMovement
### Title: Resample a simulated movement and compute step-wise statistics
### Aliases: sampleMovement

### ** Examples

library(SiMRiv)

LevyWalker <- species(
  state.RW() + state.CRW(0.99),
  trans = transitionMatrix(0.005, 0.02))

sim <- simulate(LevyWalker, 10000)
resamp <- sampleMovement(sim, 50)
plot(sim, type="l", asp=1, col = "#777777")
lines(resamp$relocs, col = "red")



