library(TDD)


### Name: PZ2Coef
### Title: Calculate Recursive Filter Coefficients
### Aliases: PZ2Coef
### Keywords: misc

### ** Examples

PZ_40T = list(poles = c(-0.149 + 0.149i, -0.149 - 0.149i, -503, -1010,
-1130), zeros = c(0, 0), Knorm = 574095649, Sense = 800)

dt = 0.01
PZ2Coef(PZ_40T, dt)



