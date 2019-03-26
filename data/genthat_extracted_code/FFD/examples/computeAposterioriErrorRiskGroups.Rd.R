library(FFD)


### Name: computeAposterioriErrorRiskGroups
### Title: FUNCTION to compute the a-posteriori error considering a
###   population stratified into risk geroups.
### Aliases: computeAposterioriErrorRiskGroups
### Keywords: misc

### ** Examples

data(sheepData)
sheepData$size <- ifelse(sheepData$nSheep < 30, "small", "large")
riskValueData <- data.frame(riskGroup = c("small", "large"), 
    riskValues = c(1,2))
mySurvey <- surveyData(nAnimalVec = sheepData$nSheep,
		riskGroupVec = sheepData$size,
		riskValueData = riskValueData,
		populationData = sheepData, designPrevalence = 0.002,
		alpha = 0.05, intraHerdPrevalence = 0.13,
		diagSensitivity = 0.9, costHerd = 30, costAnimal = 7.1)
## Limited sampling with risk groups:    
myLtdSamplingRG <- ltdSampling(survey.Data = mySurvey, sampleSizeLtd = 20, 
	nSampleFixVec = NULL, probVec = c(1,2))
## Draw sample manually:
set.seed(20110708)
x <- myLtdSamplingRG
indexSampleRG <- sapply(seq(along = x@surveyData@riskValueData$riskGroup), 
	function(ii){
		riskGroup <- as.character(x@surveyData@riskValueData$riskGroup[ii])
		nSampleRG <- x@nHerdsPerRiskGroup[riskGroup]
		indexRG <- which(x@surveyData@riskGroupVec == riskGroup)
		indexOut <- sample(x = indexRG, size = nSampleRG, replace = FALSE)		
	})
indexSample <- sort(Reduce(function(x,y) c(x,y), indexSampleRG))
## Compute the a-posteriori alpha error:
alphaErrorVector <- computeAlpha(nAnimalVec = x@surveyData@nAnimalVec[indexSample], 
     method = "limited", sampleSizeLtd = x@sampleSizeLtd, 
     intraHerdPrevalence = x@surveyData@intraHerdPrevalence, 
     diagSensitivity = x@surveyData@diagSensitivity, diagSpecificity = 1)    
## Determine the number of herds in each risk group:
riskValueDf <- mySurvey@riskValueData[,1:2]
names(riskValueDf) <- c("riskGroup", "riskValues")
riskValueDf$riskGroup <- as.character(riskValueDf$riskGroup)
riskValueDf$id <- seq(along = riskValueDf[,1])
riskGroupTab <- table(mySurvey@riskGroupVec)
riskGroupDf <- data.frame(riskGroup = as.character(names(riskGroupTab)), 
	nPopulation = as.vector(riskGroupTab))
riskValueDf <- merge(x = riskValueDf, y = riskGroupDf, by = "riskGroup",
	sort = FALSE)	
riskValueDf <- riskValueDf[order(riskValueDf$id, decreasing = FALSE),]
aPostAlphaRG <- computeAposterioriErrorRiskGroups(alphaErrorVector = alphaErrorVector, 
     groupVec = x@surveyData@riskGroupVec[indexSample], 
	 groupLevels = riskValueDf$riskGroup,
	 nPopulationVec = riskValueDf$nPopulation,
	 nRelRiskVec = riskValueDf$riskValues,
     nDiseased = max(round(length(x@surveyData@nAnimalVec)*x@surveyData@designPrevalence),1), 
     method = "approx")     



