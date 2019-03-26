library(msme)


### Name: summary.msme
### Title: A summary method for objects of class msme.
### Aliases: summary.msme
### Keywords: ~models

### ** Examples


data(medpar)

ml.poi <- ml_glm(los ~ hmo + white,
                 family = "poisson",
                 link = "log",
                 data = medpar)

summary(ml.poi)





