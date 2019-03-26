library(TDD)


### Name: MakeDPZ
### Title: Calculate Find Digital Match to Analog Poles/Zeros
### Aliases: MakeDPZ
### Keywords: misc

### ** Examples

# Response of Guralp CMG-40T

PZ = list(poles = c(-0.149 + 0.149i, -0.149 - 0.149i, -503, -1010,
-1130), zeros = c(0, 0), Knorm = 574095649, Sense = 800)
# MakeDPZ(PZ, dt = 0.01, fmin = 1/60) # takes minutes to run




