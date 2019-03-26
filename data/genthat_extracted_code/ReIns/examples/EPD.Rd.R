library(ReIns)


### Name: EPD
### Title: EPD estimator
### Aliases: EPD

### ** Examples

data(secura)

# EPD estimates for the EVI
epd <- EPD(secura$size, plot=TRUE)

# Compute return periods
ReturnEPD(secura$size, 10^10, gamma=epd$gamma, kappa=epd$kappa, 
          tau=epd$tau, plot=TRUE)



