library(msme)


### Name: hatvalues.msme
### Title: Function to return the hat matrix of a msme-class model.
### Aliases: hatvalues.msme
### Keywords: ~models

### ** Examples

data(medpar)

ml.poi <- ml_glm(los ~ hmo + white,
                 family = "poisson",
                 link = "log",
                 data = medpar)

str(diag(hatvalues(ml.poi)))




