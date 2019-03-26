library(ReIns)


### Name: ExcessEPD
### Title: Estimates for excess-loss premiums using EPD estimates
### Aliases: ExcessEPD

### ** Examples

data(secura)

# EPD estimator
epd <- EPD(secura$size)

# Premium of excess-loss insurance with retention R
R <- 10^7
ExcessEPD(secura$size, gamma=epd$gamma, kappa=epd$kappa, tau=epd$tau, R=R, ylim=c(0,2*10^4))



