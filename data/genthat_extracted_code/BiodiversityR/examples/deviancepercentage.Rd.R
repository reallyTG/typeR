library(BiodiversityR)


### Name: deviancepercentage
### Title: Calculate Percentage and Significance of Deviance Explained by a
###   GLM
### Aliases: deviancepercentage
### Keywords: multivariate

### ** Examples

library(vegan)
data(dune)
data(dune.env)
dune.env$Agrostol <- dune$Agrostol
Count.model1 <- glm(Agrostol ~ Management + A1, family=quasipoisson(link=log), 
    data=dune.env, na.action=na.omit)
summary(Count.model1)
deviancepercentage(Count.model1, dune.env, digits=3)



