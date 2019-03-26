library(mvdalab)


### Name: coefsplot
### Title: Graphical Summary Information Pertaining to the Regression
###   Coefficients
### Aliases: coefsplot

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
coefsplot(mod1, ncomp = 1:2)



