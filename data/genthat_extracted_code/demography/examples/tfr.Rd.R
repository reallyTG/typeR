library(demography)


### Name: tfr
### Title: Compute total fertility rate from fertility rates
### Aliases: tfr
### Keywords: models

### ** Examples

plot(tfr(aus.fert))
ausfert.fcast <- forecast(fdm(aus.fert))
plot(tfr(ausfert.fcast,PI=TRUE,nsim=400))



