library(msme)


### Name: ml_glm3
### Title: A reduced maximum likelihood fitting function that omits null
###   models.
### Aliases: ml_glm3
### Keywords: ~models

### ** Examples


data(medpar)
med.nb.g <- ml_glm3(los ~ hmo + white,
                   family = "gNegBinomial", 
                   link = "log",
                   group = medpar$provnum, 
                   data = medpar)
summary(med.nb.g)




