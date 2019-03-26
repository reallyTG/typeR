library(pez)


### Name: fingerprint.regression
### Title: Regress trait evolution against trait ecology (following
###   Cavender-Bares et al. 2004)
### Aliases: fingerprint.regression plot.fingerprint.regression
###   print.fingerprint.regression summary.fingerprint.regression

### ** Examples

data(laja)
data <- comparative.comm(invert.tree, river.sites, invert.traits, river.env)
fingerprint.regression(data, eco.permute=10)
plot(fingerprint.regression(data, permute=10, method="lm"))



