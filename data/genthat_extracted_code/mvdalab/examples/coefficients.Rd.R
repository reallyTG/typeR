library(mvdalab)


### Name: coefficients.mvdareg
### Title: Extract Summary Information Pertaining to the Coefficients
###   resulting from a PLS model
### Aliases: coefficients.mvdareg

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
coefficients(mod1)



