library(sars)


### Name: fit_collection
### Title: Create a Collection of SAR Model Fits
### Aliases: fit_collection

### ** Examples

data(galap)
fit <- sar_linear(galap)
fit2 <- sar_power(galap)
fitC <- fit_collection(fit, fit2)
plot(fitC)



