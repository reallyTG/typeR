library(cds)


### Name: approxloads
### Title: Low Rank Approximation LL' of a Square Symmetrix Matrix R
### Aliases: approxloads

### ** Examples

R <- rcormat(10, r = 3)
all.equal(R$L, approxloads(R$R, r = 3, procr.target = R$L))



