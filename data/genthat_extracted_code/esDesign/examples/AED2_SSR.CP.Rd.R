library(esDesign)


### Name: AED2_SSR.CP
### Title: Calculate the N2 and the critical value C in the Adaptive
###   Enrichment Design (Strategy 2) with Sample Size Re-estimation
###   Procedure
### Aliases: AED2_SSR.CP

### ** Examples

Z1 <- 1.974
delta <- 0.355
N1 <- 248
pstar <- 0.15
alpha <- 0.05
rho <- 0.5
epsilon <- 0.5
beta <- 0.20
N2 <- 104
res <- AED2_SSR.CP(Z1 = Z1, delta = delta, N1 = N1, pstar = pstar,
           alpha = alpha, rho = rho, epsilon = epsilon,
           beta = beta, N2 = N2)




