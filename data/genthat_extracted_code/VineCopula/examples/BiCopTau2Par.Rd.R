library(VineCopula)


### Name: BiCopTau2Par
### Title: Parameter of a Bivariate Copula for a given Kendall's Tau Value
### Aliases: BiCopTau2Par

### ** Examples

## Example 1: Gaussian copula
tau0 <- 0.5
rho <- BiCopTau2Par(family = 1, tau = tau0)
BiCop(1, tau = tau0)$par  # alternative

## Example 2:
vtau <- seq(from = 0.1, to = 0.8, length.out = 100)
thetaC <- BiCopTau2Par(family = 3, tau = vtau)
thetaG <- BiCopTau2Par(family = 4, tau = vtau)
thetaF <- BiCopTau2Par(family = 5, tau = vtau)
thetaJ <- BiCopTau2Par(family = 6, tau = vtau)
plot(thetaC ~ vtau, type = "l", ylim = range(thetaF))
lines(thetaG ~ vtau, col = 2)
lines(thetaF ~ vtau, col = 3)
lines(thetaJ ~ vtau, col = 4)

## Example 3: different copula families
theta <- BiCopTau2Par(family = c(3,4,6), tau = c(0.4, 0.5, 0.6))
BiCopPar2Tau(family = c(3,4,6), par = theta)

## Don't show: 
# Test BiCopTau2Par
BiCopTau2Par(family = 0, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 1, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 2, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 3, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 4, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 5, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 6, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 13, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 14, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 16, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 23, tau = -c(0.4,0.5,0.6))
BiCopTau2Par(family = 24, tau = -c(0.4,0.5,0.6))
BiCopTau2Par(family = 26, tau = -c(0.4,0.5,0.6))
BiCopTau2Par(family = 33, tau = -c(0.4,0.5,0.6))
BiCopTau2Par(family = 34, tau = -c(0.4,0.5,0.6))
BiCopTau2Par(family = 36, tau = -c(0.4,0.5,0.6))
BiCopTau2Par(family = 41, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 51, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 61, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 71, tau = c(0.4,0.5,0.6))
BiCopTau2Par(family = 41, tau = -c(0.4,0.5,0.6))
BiCopTau2Par(family = 51, tau = -c(0.4,0.5,0.6))
BiCopTau2Par(family = 61, tau = -c(0.4,0.5,0.6))
BiCopTau2Par(family = 71, tau = -c(0.4,0.5,0.6))
## End(Don't show)




