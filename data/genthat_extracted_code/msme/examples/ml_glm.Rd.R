library(msme)


### Name: ml_glm
### Title: A function to fit generalized linear models using maximum
###   likelihood.
### Aliases: ml_glm
### Keywords: ~models

### ** Examples

data(medpar)

ml.poi <- ml_glm(los ~ hmo + white,
                 family = "poisson",
                 link = "log",
                 data = medpar)
ml.poi
summary(ml.poi)




