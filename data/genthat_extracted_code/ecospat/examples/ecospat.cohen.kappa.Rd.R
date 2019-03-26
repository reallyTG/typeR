library(ecospat)


### Name: ecospat.cohen.kappa
### Title: Cohen's Kappa
### Aliases: ecospat.cohen.kappa

### ** Examples

Pred <- ecospat.testData$glm_Agrostis_capillaris
Sp.occ <- ecospat.testData$Agrostis_capillaris
th <- 0.39 # threshold
xtab <- table(Pred >= th, Sp.occ)

ecospat.cohen.kappa(xtab)



