library(SimCop)


### Name: NewMEVAsyLogisticCopula
### Title: Creates a multivariate asymmetric logistic copula
### Aliases: NewMEVAsyLogisticCopula
### Keywords: distribution

### ** Examples

theta <-  rbind(c(0, 0.2, 0.8), c(1,0.8,0.2))
r <- c(2,3)
cop <- NewMEVAsyLogisticCopula(theta, r)

## Creates the same copula
theta <- 0.2
phi <- 0.4
r <- 2
cop1 <- NewBEVAsyLogisticCopula(r, theta, phi)
theta <- cbind(c(phi, 1-phi, 0), c(theta, 0, 1-theta))
r <- c(r, 1,  1)
cop2 <- NewMEVAsyLogisticCopula(theta, r)




