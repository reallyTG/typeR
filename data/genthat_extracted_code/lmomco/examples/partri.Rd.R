library(lmomco)


### Name: partri
### Title: Estimate the Parameters of the Asymmetric Triangular
###   Distribution
### Aliases: partri
### Keywords: distribution (parameters) Distribution: Asymmetric Triangular
###   Distribution: Triangular

### ** Examples

lmr <- lmomtri(vec2par(c(10,90,100), type="tri"))
partri(lmr)

partri(lmomtri(vec2par(c(-11, 67,67), type="tri")))$para
partri(lmomtri(vec2par(c(-11,-11,67), type="tri")))$para



