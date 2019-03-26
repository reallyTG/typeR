library(mistat)


### Name: OTURB1
### Title: Cycle Times of a Piston from the Piston Simulator
### Aliases: OTURB1
### Keywords: datasets

### ** Examples

data(OTURB1)

REF <- round(pistonSimulation(seed=123)$seconds, 3)

plot(OTURB1, type="b", lwd=6)

lines(REF, col=2, lwd=2)

sum(OTURB1 - REF)



