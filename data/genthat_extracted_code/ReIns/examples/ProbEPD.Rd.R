library(ReIns)


### Name: ProbEPD
### Title: Estimator of small exceedance probabilities and large return
###   periods using EPD
### Aliases: ProbEPD ReturnEPD

### ** Examples

data(secura)

# EPD estimates for the EVI
epd <- EPD(secura$size, plot=TRUE)

# Compute exceedance probabilities
q <- 10^7
ProbEPD(secura$size, q=q, gamma=epd$gamma, kappa=epd$kappa, tau=epd$tau, plot=TRUE)

# Compute return periods
ReturnEPD(secura$size, q=q, gamma=epd$gamma, kappa=epd$kappa, tau=epd$tau, 
          plot=TRUE, ylim=c(0,10^4))



