library(ggfortify)


### Name: confint.acf
### Title: Calcurate confidence interval for 'stats::acf'
### Aliases: confint.acf

### ** Examples

air.acf <- acf(AirPassengers, plot = FALSE)
ggfortify:::confint.acf(air.acf)
ggfortify:::confint.acf(air.acf, ci.type = 'ma')



