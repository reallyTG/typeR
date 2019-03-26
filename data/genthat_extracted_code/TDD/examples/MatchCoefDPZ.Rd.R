library(TDD)


### Name: MatchCoefDPZ
### Title: Find Digital Match to Analog Poles/Zeros
### Aliases: MatchCoefDPZ
### Keywords: misc

### ** Examples

# Response of Guralp CMG-40T

PZ = list(poles = c(-0.149 + 0.149i, -0.149 - 0.149i, -503, -1010,
-1130), zeros = c(0, 0), Knorm = 574095649, Sense = 800)
# MatchCoefDPZ(PZ, dt = 0.01, N = 10000) # takes minutes to run



