library(mvdalab)


### Name: acfplot
### Title: Plot of Auto-correlation Funcion
### Aliases: acfplot

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
acfplot(mod1, parm = NULL)



