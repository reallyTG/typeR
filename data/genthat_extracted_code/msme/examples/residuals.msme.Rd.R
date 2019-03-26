library(msme)


### Name: residuals.msme
### Title: Function to produce residuals from a model of class msme.
### Aliases: residuals.msme
### Keywords: ~models

### ** Examples

data(medpar)

ml.poi <- ml_glm(los ~ hmo + white,
                 family = "poisson",
                 link = "log",
                 data = medpar)

str(residuals(ml.poi))




