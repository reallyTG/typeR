library(DFIT)


### Name: UnsignedArea
### Title: Calculates Raju's Unsigned Area Measure index for an item with
###   given item parameters of focal and reference groups.
### Aliases: UnsignedArea

### ** Examples


data(dichotomousItemParameters)
uam3pl <- UnsignedArea(itemParameters = dichotomousItemParameters, irtModel = "3pl",
                       subdivisions = 5000, logistic = TRUE)




