## ------------------------------------------------------------------------
library(GESE)

## ------------------------------------------------------------------------
data(dataRaw)
dim(dataRaw)
dataRaw[1:10,]
length(unique(dataRaw$FID))

## ------------------------------------------------------------------------
data(mapInfo)
mapInfo[1:3, ]
dim(mapInfo)

## ------------------------------------------------------------------------
data(pednew)
dim(pednew)
pednew[1:5,]

## ------------------------------------------------------------------------
data(database)
dim(database)
database[1:5,]

## ---- results="hide"-----------------------------------------------------
results <- getSegInfo(pednew,  dataRaw, mapInfo, mode="dominant")
results

## ---- echo=FALSE---------------------------------------------------------
results

## ---- results="hide"-----------------------------------------------------
results <- getSegInfo(pednew,  dataRaw, mapInfo)
results

## ---- echo=FALSE---------------------------------------------------------
results

## ---- results="hide"-----------------------------------------------------
results <- getSegInfo(pednew,  dataRaw, mapInfo, mode="CH")
results

## ---- echo=FALSE---------------------------------------------------------
results

## ---- results="hide"-----------------------------------------------------
results <- GESE(pednew, database, 1000000, dataRaw, mapInfo, threshold=1e-5,
                onlySeg=TRUE)
results

## ---- echo=FALSE---------------------------------------------------------
results

## ---- results="hide"-----------------------------------------------------
results2 <- GESE(pednew, database, 1000000, dataRaw, mapInfo, threshold=1e-5)
results2

## ---- echo=FALSE---------------------------------------------------------
results2

## ------------------------------------------------------------------------
results2$results

## ---- results="hide"-----------------------------------------------------
### creating weights for the families (same weights for all genes)
fams <- unique(dataRaw$FID)
nfam = length(fams)
temp = runif(nfam)
famWeight <- temp/sum(temp)
weightFam = data.frame(FID=fams, weight=famWeight)
results3 <- GESE(pednew, database, 1000000, dataRaw, mapInfo, threshold=1e-5,
             familyWeight=weightFam)
results3$results

## ---- echo=FALSE---------------------------------------------------------
results3$results

