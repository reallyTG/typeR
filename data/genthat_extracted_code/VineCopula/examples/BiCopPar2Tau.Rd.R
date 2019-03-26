library(VineCopula)


### Name: BiCopPar2Tau
### Title: Kendall's Tau Value of a Bivariate Copula
### Aliases: BiCopPar2Tau

### ** Examples

## Example 1: Gaussian copula
tau0 <- 0.5
rho <- BiCopTau2Par(family = 1, tau = tau0)
# transform back
tau <- BiCopPar2Tau(family = 1, par = rho)
tau - 2/pi*asin(rho)

## Example 2:
vpar <- seq(from = 1.1, to = 10, length.out = 100)
tauC <- BiCopPar2Tau(family = 3, par = vpar)
tauG <- BiCopPar2Tau(family = 4, par = vpar)
tauF <- BiCopPar2Tau(family = 5, par = vpar)
tauJ <- BiCopPar2Tau(family = 6, par = vpar)
plot(tauC ~ vpar, type = "l", ylim = c(0,1))
lines(tauG ~ vpar, col = 2)
lines(tauF ~ vpar, col = 3)
lines(tauJ ~ vpar, col = 4)

## Example 3: different copula families
theta <- BiCopTau2Par(family = c(3,4,6), tau = c(0.4, 0.5, 0.6))
BiCopPar2Tau(family = c(3,4,6), par = theta)

## Don't show: 
# Test BiCopPar2Tau (one parametric families)
theta <- BiCopTau2Par(family = 0, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 0, par = theta)
theta <- BiCopTau2Par(family = 1, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 1, par = theta)
theta <- BiCopTau2Par(family = 3, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 3, par = theta)
theta <- BiCopTau2Par(family = 4, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 4, par = theta)
theta <- BiCopTau2Par(family = 5, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 5, par = theta)
theta <- BiCopTau2Par(family = 6, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 6, par = theta)
theta <- BiCopTau2Par(family = 13, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 13, par = theta)
theta <- BiCopTau2Par(family = 14, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 14, par = theta)
theta <- BiCopTau2Par(family = 16, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 16, par = theta)
theta <- BiCopTau2Par(family = 23, tau = -c(0.4,0.5,0.6))
BiCopPar2Tau(family = 23, par = theta)
theta <- BiCopTau2Par(family = 24, tau = -c(0.4,0.5,0.6))
BiCopPar2Tau(family = 24, par = theta)
theta <- BiCopTau2Par(family = 26, tau = -c(0.4,0.5,0.6))
BiCopPar2Tau(family = 26, par = theta)
theta <- BiCopTau2Par(family = 33, tau = -c(0.4,0.5,0.6))
BiCopPar2Tau(family = 33, par = theta)
theta <- BiCopTau2Par(family = 34, tau = -c(0.4,0.5,0.6))
BiCopPar2Tau(family = 34, par = theta)
theta <- BiCopTau2Par(family = 36, tau = -c(0.4,0.5,0.6))
BiCopPar2Tau(family = 36, par = theta)
theta <- BiCopTau2Par(family = 41, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 41, par = theta)
theta <- BiCopTau2Par(family = 51, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 51, par = theta)
theta <- BiCopTau2Par(family = 61, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 61, par = theta)
theta <- BiCopTau2Par(family = 71, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 71, par = theta)
theta <- BiCopTau2Par(family = 41, tau = -c(0.4,0.5,0.6))
BiCopPar2Tau(family = 41, par = theta)
theta <- BiCopTau2Par(family = 51, tau = -c(0.4,0.5,0.6))
BiCopPar2Tau(family = 51, par = theta)
theta <- BiCopTau2Par(family = 61, tau = -c(0.4,0.5,0.6))
BiCopPar2Tau(family = 61, par = theta)
theta <- BiCopTau2Par(family = 71, tau = -c(0.4,0.5,0.6))
BiCopPar2Tau(family = 71, par = theta)

# Test BiCopPar2Tau (two parametric families)
theta <- BiCopTau2Par(family = 2, tau = c(0.4,0.5,0.6))
BiCopPar2Tau(family = 2, par = theta)
theta <- 1:3
delta <- 1:3
BiCopPar2Tau(family = 7, par = theta, par2 = delta)
BiCopPar2Tau(family = 17, par = theta, par2 = delta)
theta <- -(1:3)
delta <- -(1:3)
BiCopPar2Tau(family = 27, par = theta, par2 = delta)
BiCopPar2Tau(family = 37, par = theta, par2 = delta)
theta <- 2:4
delta <- 1:3
BiCopPar2Tau(family = 8, par = theta, par2 = delta)
BiCopPar2Tau(family = 18, par = theta, par2 = delta)
theta <- -(2:4)
delta <- -(1:3)
BiCopPar2Tau(family = 28, par = theta, par2 = delta)
BiCopPar2Tau(family = 38, par = theta, par2 = delta)
theta <- 1:3
delta <- 1:3
BiCopPar2Tau(family = 9, par = theta, par2 = delta)
BiCopPar2Tau(family = 19, par = theta, par2 = delta)
theta <- -(1:3)
delta <- -(1:3)
BiCopPar2Tau(family = 29, par = theta, par2 = delta)
BiCopPar2Tau(family = 39, par = theta, par2 = delta)
theta <- 2:4
delta <- c(0.1, 0.5, 0.9)
BiCopPar2Tau(family = 10, par = theta, par2 = delta)
BiCopPar2Tau(family = 20, par = theta, par2 = delta)
theta <- -(2:4)
delta <- -c(0.1, 0.5, 0.9)
BiCopPar2Tau(family = 30, par = theta, par2 = delta)
BiCopPar2Tau(family = 40, par = theta, par2 = delta)

theta <- 2:4
delta <- c(0.1, 0.5, 0.9)
BiCopPar2Tau(family = 104, par = theta, par2 = delta)
BiCopPar2Tau(family = 114, par = theta, par2 = delta)
theta <- -(2:4)
delta <- c(0.1, 0.5, 0.9)
BiCopPar2Tau(family = 124, par = theta, par2 = delta)
BiCopPar2Tau(family = 134, par = theta, par2 = delta)

theta <- 2:4
delta <- c(0.1, 0.5, 0.9)
BiCopPar2Tau(family = 204, par = theta, par2 = delta)
BiCopPar2Tau(family = 214, par = theta, par2 = delta)
theta <- -(2:4)
delta <- c(0.1, 0.5, 0.9)
BiCopPar2Tau(family = 224, par = theta, par2 = delta)
BiCopPar2Tau(family = 234, par = theta, par2 = delta)
## End(Don't show)




