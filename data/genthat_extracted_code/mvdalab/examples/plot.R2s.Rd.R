library(mvdalab)


### Name: plot.R2s
### Title: Plot of R2
### Aliases: plot.R2s

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
plot(R2s(mod1))



