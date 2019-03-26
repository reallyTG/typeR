library(msme)


### Name: alrt
### Title: Function to compute asymptotic likelihood ratio test of two
###   models.
### Aliases: alrt
### Keywords: ~models

### ** Examples

data(medpar)

ml.poi.1 <- ml_glm(los ~ hmo + white,
                   family = "poisson",
                   link = "log",
                   data = medpar)

ml.poi.2 <- ml_glm(los ~ hmo,
                   family = "poisson",
                   link = "log",
                   data = medpar)

alrt(ml.poi.1, ml.poi.2)




