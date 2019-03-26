library(mvdalab)


### Name: weights
### Title: Extract Summary Information Pertaining to the Bootstrapped
###   weights
### Aliases: weights.mvdareg

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
weights(mod1, ncomp = 2, conf = .95)



