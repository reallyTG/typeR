library(GESE)


### Name: condSegProbF
### Title: Computes conditional segregation probability for the family
### Aliases: condSegProbF
### Keywords: probability

### ** Examples

data(pednew)
data(mapInfo)
data(dataRaw)
data(database)
library(kinship2)
pedigrees = kinship2::pedigree(pednew$IID, pednew$faID, pednew$moID,pednew$sex,famid=pednew$FID)
subjects= dataRaw[,c(1,2,6)]
condSegProbF(pedigrees['93'], subjects)
condSegProbF(pedigrees['412'], subjects)
results2 <- GESE(pednew, database, 1000000, dataRaw, mapInfo, threshold=1e-2)
results2$condSegProb



