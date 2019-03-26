library(reams)


### Name: eic
### Title: Extended (bootstrap) information criterion
### Aliases: eic

### ** Examples

# Predicting fertility from provincial socioeconomic indicators
data(swiss)
eicobj <- eic(swiss$Fertility, swiss[ , -1], nboot=100)
eicobj$best



