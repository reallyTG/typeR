library(esDesign)


### Name: AED1_SSR.sim
### Title: Conduct the simulation studies of the Adaptive Enrichment Design
###   (Strategy 1) with Sample Size Re-estimation Procedure
### Aliases: AED1_SSR.sim

### ** Examples

res <- AED1_SSR.sim(
  N1 = 310, rho = 0.5,
  alpha = 0.05, beta = 0.2, pstar = 0.2,
  theta = c(0,0), theta0 = 0, Info = 0.5,
  epsilon = 0.5, sigma0 = 1, nSim = 1000, Seed = 6)



