library(mvdalab)


### Name: print.mvdalab
### Title: Print Methods for mvdalab Objects
### Aliases: print.mvdareg

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], 
               ncomp = 2, validation = "loo")
print(mod1, ncomp = 2)
summary(mod1, ncomp = 2)



