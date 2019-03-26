library(mvdalab)


### Name: T2
### Title: Generates a Hotelling's T2 Graph
### Aliases: T2

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
T2(mod1, ncomp = 2)



