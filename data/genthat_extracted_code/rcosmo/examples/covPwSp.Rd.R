library(rcosmo)


### Name: covPwSp
### Title: Covariance estimate via power spectra
### Aliases: covPwSp

### ** Examples


## Download the power spectrum first
# N <- 20000
# COM_PowerSpectra <- downloadCMBPS(link=1)
#
# Cov_est <- covPwSp(COM_PowerSpectra[,1:2], N)
# plot(Cov_est, type="l")

## Plot the covariance estimate as a function of angular distances
# plot(acos(Cov_est[,1]), Cov_est[,2], type ="l",
#      xlab ="angular distance", ylab ="Estimated Covariance")




