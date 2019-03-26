library(GMCM)


### Name: inv.tt
### Title: Reparametrization of GMCM parameters
### Aliases: inv.tt tt
### Keywords: internal

### ** Examples

par <- c(pie1 = 0.3, mu = 2, sigma = 0.5, rho = 0.8)
tpar <- GMCM:::inv.tt(par, d = 3, positive.rho = FALSE)
GMCM:::tt(tpar, d = 3, positive.rho = FALSE)



