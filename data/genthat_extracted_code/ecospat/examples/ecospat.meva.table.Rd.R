library(ecospat)


### Name: ecospat.meva.table
### Title: Model Evaluation For A Given Threshold Value
### Aliases: ecospat.meva.table
### Keywords: file

### ** Examples


Pred <- ecospat.testData$glm_Agrostis_capillaris
Sp.occ <- ecospat.testData$Agrostis_capillaris

meva <- ecospat.meva.table (Pred, Sp.occ, 0.39)



