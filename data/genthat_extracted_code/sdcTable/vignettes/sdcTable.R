## ---- echo=F-------------------------------------------------------------
suppressPackageStartupMessages(library(sdcTable))

## ---- eval=TRUE----------------------------------------------------------
library(sdcTable)
packageVersion("sdcTable")

## ---- echo=FALSE---------------------------------------------------------
# daten laden
workDat <- get(load('workDat.RData'))
inputData <- workDat$inputData
microData <- inputData$microDat
aggregatedData <- inputData$aggDat
dimList <- inputData$dimList

resOPT <- workDat$resOPT

completeData <- getInfo(workDat$resOPT, 'finalData')
completeData <- completeData[,-ncol(completeData)]

## ---- echo=FALSE---------------------------------------------------------
print(head(microData), row.names=FALSE)

## ---- echo=FALSE---------------------------------------------------------
lev.V1 <- as.character(sort(unique(microData$V1)))
lev.V2 <- as.character(sort(unique(microData$V2)))
lev.V3 <- as.character(sort(unique(microData$V3)))

## ---- echo=FALSE---------------------------------------------------------
print(lev.V1)

## ---- echo=FALSE---------------------------------------------------------
print(lev.V2)

## ---- echo=FALSE---------------------------------------------------------
print(lev.V3)

## ------------------------------------------------------------------------
print(tail(completeData))

## ---- echo=FALSE---------------------------------------------------------
levComp.V1 <- as.character(dimList$V1[,2])
levComp.V2 <- as.character(dimList$V2[,2])
levComp.V3 <- as.character(dimList$V3[,2])

## ---- echo=FALSE---------------------------------------------------------
print(levComp.V1)

## ---- echo=FALSE---------------------------------------------------------
print(levComp.V2)

## ---- echo=FALSE---------------------------------------------------------
print(levComp.V3)

## ---- echo=FALSE---------------------------------------------------------
x <- completeData[nrow(completeData),]

## ---- echo=FALSE---------------------------------------------------------
subTots.V1 <- setdiff(levComp.V1, lev.V1)
print(subTots.V1)

## ---- echo=FALSE---------------------------------------------------------
subTots.V2 <- setdiff(levComp.V2, lev.V2)
print(subTots.V2)

## ---- echo=FALSE---------------------------------------------------------
subTots.V3 <- setdiff(levComp.V3, lev.V3)
print(subTots.V3)

## ------------------------------------------------------------------------
dimV1 <- matrix(nrow=0, ncol=2)
dimV1 <- rbind(dimV1, c('@','Tot'))
print(dimV1)

## ------------------------------------------------------------------------
mat <- matrix(nrow=4, ncol=2)
mat[,1] <- rep('@@',4)
mat[,2] <- LETTERS[1:4]
dimV1 <- rbind(dimV1, mat)
print(dimV1)

## ------------------------------------------------------------------------
mat <- matrix(nrow=3, ncol=2)
mat[,1] <- rep('@@@',3)
mat[,2] <- c('Ba','Bb','Bc')

dimV1 <- rbind(dimV1, mat)
print(dimV1)

## ------------------------------------------------------------------------
dimV1 <- dimV1[c(1:3,6:8, 4:5),]
print(dimV1, row.names=FALSE)

## ------------------------------------------------------------------------
dimV1 <- hier_create(root = "Tot", nodes = LETTERS[1:4])
dimV1 <- hier_add(dimV1, root = "B", nodes = c("Ba","Bb","Bc"))
hier_display(dimV1)

## ------------------------------------------------------------------------
dimV2 <- hier_create(root = "Tot", nodes = c("m", "w"))
hier_display(dimV2)

## ------------------------------------------------------------------------
dimV3 <- hier_create(root = "Tot", nodes = letters[1:6])
hier_display(dimV3)

## ------------------------------------------------------------------------
dimInfo <- list(V1=dimV1, V2=dimV2, V3=dimV3)

prob.microDat <- makeProblem(
	data=microData,
	dimList=dimList,
	dimVarInd=1:3,
	freqVarInd=NULL,
	numVarInd=4:5,
	weightInd=NULL,
	sampWeightInd=NULL)

## ------------------------------------------------------------------------
### problem from complete data ###
dimInfo <- list(V1=dimV1, V2=dimV2, V3=dimV3)
prob.completeDat <- makeProblem(
	data=completeData,
	dimList=dimList,
	dimVarInd=1:3,
	freqVarInd=4,
	numVarInd=5:6,
	weightInd=NULL,
	sampWeightInd=NULL)

## ------------------------------------------------------------------------
all(c(class(prob.microDat), class(prob.completeDat))=='sdcProblem')

## ------------------------------------------------------------------------
counts1 <- getInfo(prob.completeDat, type='freq')
counts2 <- getInfo(prob.microDat, type='freq')
all(counts1==counts2)

## ------------------------------------------------------------------------
prob.completeDat <- primarySuppression(prob.completeDat, type='freq', maxN=10)

## ------------------------------------------------------------------------
print(table(getInfo(prob.completeDat, type="sdcStatus")))
summary(prob.completeDat)

## ---- echo=FALSE---------------------------------------------------------
nrPrimSupps <- length(which(getInfo(prob.completeDat, type='sdcStatus')=='u'))

## ---- eval=FALSE---------------------------------------------------------
#  resHITAS <- protectTable(prob.completeDat, method="HITAS")
#  resOPT <- protectTable(prob.completeDat, method="OPT")
#  resHYPER <- protectTable(prob.completeDat, method="HYPERCUBE")
#  resSIMPLE <- protectTable(prob.completeDat, method="SIMPLEHEURISTIC")

## ------------------------------------------------------------------------
finalData <- getInfo(resOPT, type='finalData')
print(head(finalData))

## ------------------------------------------------------------------------
summary(resOPT)

