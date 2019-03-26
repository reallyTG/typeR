library(SimCorrMix)


### Name: rho_M1M2
### Title: Approximate Correlation between Two Continuous Mixture Variables
###   M1 and M2
### Aliases: rho_M1M2
### Keywords: correlation mixture

### ** Examples

# M1 is mixture of N(-2, 1) and N(2, 1);
# M2 is mixture of Logistic(0, 1), Chisq(4), and Beta(4, 1.5)
# pairwise correlation between components across M1 and M2 set to 0.35
L <- calc_theory("Logistic", c(0, 1))
C <- calc_theory("Chisq", 4)
B <- calc_theory("Beta", c(4, 1.5))
rho_M1M2(mix_pis = list(c(0.4, 0.6), c(0.3, 0.2, 0.5)),
  mix_mus = list(c(-2, 2), c(L[1], C[1], B[1])),
  mix_sigmas = list(c(1, 1), c(L[2], C[2], B[2])),
  p_M1M2 = matrix(0.35, 2, 3))




