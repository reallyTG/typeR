library(mvdalab)


### Name: predict.mvdareg
### Title: Model Predictions From a plsFit Model
### Aliases: predict.mvdareg

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
predict.mvdareg(mod1)
## Not run: 
##D residuals(mod1)
## End(Not run)



