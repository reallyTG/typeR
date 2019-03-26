library(sars)


### Name: sars-package
### Title: sars: Fit and compare species-area relationship models using
###   multimodel inference
### Aliases: sars-package

### ** Examples

data(galap, package = "sars")
#fit the power model
fit <- sar_power(galap)
summary(fit)
plot(fit)

#Construct a multimodel SAR curve
fit_multi <- sar_multi(galap)
summary(fit_multi)
plot(fit_multi)



