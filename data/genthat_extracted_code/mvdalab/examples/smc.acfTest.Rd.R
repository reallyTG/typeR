library(mvdalab)


### Name: smc.acfTest
### Title: Test of the Residual Significant Multivariate Correlation Matrix
###   for the presence of Autocorrelation
### Aliases: smc.acfTest

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], 
               ncomp = 2, validation = "loo")
smc.acfTest(mod1, ncomp = 2)



