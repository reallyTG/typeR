library(ecospat)


### Name: ecospat.max.tss
### Title: Maximum TSS
### Aliases: ecospat.max.tss
### Keywords: file

### ** Examples


data(ecospat.testData)
Pred <- ecospat.testData$glm_Agrostis_capillaris
Sp.occ <- ecospat.testData$Agrostis_capillaris
TSS100 <- ecospat.max.tss(Pred, Sp.occ)



