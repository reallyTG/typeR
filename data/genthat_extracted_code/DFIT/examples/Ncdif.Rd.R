library(DFIT)


### Name: Ncdif
### Title: Calculates NCDIF index for an item with given item parameters of
###   focal and reference groups.
### Aliases: Ncdif

### ** Examples


data(dichotomousItemParameters)
threePlNcdif <- Ncdif(itemParameters = dichotomousItemParameters, irtModel = '3pl',
                      focalAbilities = NULL, focalDistribution = "norm",
                      subdivisions = 5000, logistic = TRUE)




