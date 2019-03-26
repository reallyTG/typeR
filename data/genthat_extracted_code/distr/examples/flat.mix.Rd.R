library(distr)


### Name: flat.mix
### Title: Default procedure to fill slots d,p,q given r for Lebesgue
###   decomposed distributions
### Aliases: flat.mix
### Keywords: distribution arith

### ** Examples

D1 <- Norm()
D2 <- Pois(1)
D3 <- Binom(1,.4)
D4 <- UnivarMixingDistribution(D1,D2,D3, mixCoeff = c(0.4,0.5,0.1), 
      withSimplify = FALSE)
D <- UnivarMixingDistribution(D1,D4,D1,D2, mixCoeff = c(0.4,0.3,0.1,0.2), 
      withSimplify = FALSE)
D
D0<-flat.mix(D)
D0
plot(D0)



