library(DFIT)


### Name: SignedArea
### Title: Calculates Raju's Signed Area Measure index for an item with
###   given item parameters of focal and reference groups.
### Aliases: SignedArea

### ** Examples


data(dichotomousItemParameters)
sam3pl <- SignedArea(itemParameters = dichotomousItemParameters, irtModel = "3pl",
                     subdivisions = 5000, logistic = TRUE)




