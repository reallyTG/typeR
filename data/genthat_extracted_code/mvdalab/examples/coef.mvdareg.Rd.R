library(mvdalab)


### Name: coef.mvdareg
### Title: Extract Information From a plsFit Model
### Aliases: coef.mvdareg

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
coef(mod1, type = "coefficients")



