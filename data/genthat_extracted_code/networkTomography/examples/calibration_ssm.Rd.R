library(networkTomography)


### Name: calibration_ssm
### Title: Estimation for the linear SSM calibration model of Blocker &
###   Airoldi (2011)
### Aliases: calibration_ssm
### Keywords: models multivariate ts

### ** Examples

data(bell.labs)

lambda0 <- matrix(1, nrow(bell.labs$Y), ncol(bell.labs$A))
lambda0[100,] <- ipfp(y=bell.labs$Y[100,], A=bell.labs$A,
                      x0=rep(1, ncol(bell.labs$A)))
phihat0 <- rep(1, nrow(bell.labs$Y))
Ft <- 0.5 * diag_mat(rep(1, ncol(bell.labs$A)))
Rt <- 0.01 * diag_mat(rep(1, nrow(bell.labs$A)))

# Not run
#fit.calibration <- calibration_ssm(tme=100, y=bell.labs$Y, A=bell.labs$A,
#                                   Ft=Ft, Rt=Rt, lambda0=lambda0,
#                                   phihat0=phihat0, w=23)



