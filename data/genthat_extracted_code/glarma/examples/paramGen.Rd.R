library(glarma)


### Name: paramGen
### Title: Parameter Generators
### Aliases: paramGen deltaGen thetaGen phiGen
### Keywords: Initial Parameter Generators

### ** Examples

### Using the polio data
data(Polio)
y <- Polio[, 2]
X <- as.matrix(Polio[, 3:8])

## generate the theta vector
theta.lags <- c(1, 2, 5)
theta.init <- c(0.0, 0.0, 0.0)

theta <- thetaGen(theta.lags, theta.init)
print(thetaLags <- theta[[1]])
print(theta.init <- theta[[2]])

## generate the vector of phi
phi.lags <- rep(0, 0)
phi.init <- rep(0, 0)
phi <- phiGen(phi.lags, phi.init)
print(phiLags <- phi[[1]])
print(phi.init <- phi[[2]])

## generate the delta vector
delta <- deltaGen(y = y, X = X, phiInit = phi.init,
                  thetaInit = theta.init, type = "Poi",
                  alpha = 1)
delta



