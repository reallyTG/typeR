library(glarma)


### Name: mySolve
### Title: Matrix Inversion of the Hessian of the Log-Likelihood
### Aliases: mySolve
### Keywords: GLARMA

### ** Examples

### Using the polio data
data(Polio)
y <- Polio[, 2]
X <- as.matrix(Polio[, 3:8])

## Construct the vectors of phi lags and theta lags
theta.lags <- c(1, 2, 5)
phi.lags <- rep(0, 0)
## Construct the initial delta vector
delta <- c("Intcpt" = 0.2069383, "Trend" = -4.7986615 ,
           "CosAnnual" = -0.1487333, "SinAnnual" = -0.5318768,
           "CosSemiAnnual" = 0.1690998, "SinSemiAnnual" = -0.4321435,
           "theta_1" = 0, "theta_2"= 0, "theta_5"= 0 )

## Calculate the second derivative of the loglikelihood
glarmamod <- glarmaPoissonPearson(y, X, delta = delta, phiLags = phi.lags,
                           thetaLags = theta.lags, method = "FS")

## estimate the covariance matrix of the estimators from the second
## derivative of the loglikelihood
mySolve(-glarmamod$ll.dd)



