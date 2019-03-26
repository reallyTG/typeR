library(mvdalab)


### Name: ap.plot
### Title: Actual versus Predicted Plot and Residuals versus Predicted
### Aliases: ap.plot

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
ap.plot(mod1, ncomp = 2)



