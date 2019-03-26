library(mvdalab)


### Name: Xresids
### Title: Generates a Graph of the X-residuals
### Aliases: Xresids

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
Xresids(mod1, ncomp = 2)



