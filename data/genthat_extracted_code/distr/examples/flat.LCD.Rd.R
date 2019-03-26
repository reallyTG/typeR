library(distr)


### Name: flat.LCD
### Title: Flattening a list of Lebesgue decomposed distributions
### Aliases: flat.LCD
### Keywords: math distribution arith

### ** Examples

D1 <- as(Norm(),"UnivarLebDecDistribution")
D2 <- as(Pois(1),"UnivarLebDecDistribution")
D3 <- as(Binom(1,.4),"UnivarLebDecDistribution")
flat.LCD(D1,D2,D3, mixCoeff = c(0.4,0.5,0.1))



