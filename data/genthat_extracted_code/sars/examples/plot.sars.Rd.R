library(sars)


### Name: plot.sars
### Title: Plot Model Fits for a 'sars' Object
### Aliases: plot.sars

### ** Examples

data(galap)
#fit and plot a sars object of Type fit.
fit <- sar_power(galap)
plot(fit, ModTitle = "A)", lcol = "blue")

#fit and plot a sars object of Type fit_collection.
fit2 <- sar_expo(galap)
fit3 <- sar_epm1(galap)
fc <- fit_collection(fit, fit2, fit3)
plot(fc, ModTitle = letters[1:3], xlab = "Size of island")



