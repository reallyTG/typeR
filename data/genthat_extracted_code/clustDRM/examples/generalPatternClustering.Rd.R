library(clustDRM)


### Name: generalPatternClustering
### Title: Clustering dose-response curves based on their pattern
### Aliases: generalPatternClustering

### ** Examples

## gnerating data
set.seed(11)
doses2Use <-  c(0, 5, 20)
numRep2Use <- c(3, 3, 3)
generatedData <- cbind(rep(1,sum(numRep2Use)),
MCPMod::genDFdata("logistic",c(5, 3, 10, 0.05), doses2Use, 
numRep2Use, 1), 
		matrix(rnorm(1*sum(numRep2Use)), sum(numRep2Use), 1))
colnames(generatedData) <- c("ID", "dose", "response", "x1")
for (iGen in 2:15){
	genData0 <- cbind(rep(iGen,sum(numRep2Use)),
MCPMod::genDFdata("logistic",c(5, 3, 10, 0.05), doses2Use, 
numRep2Use, 1), 
			matrix(rnorm(1*sum(numRep2Use)), sum(numRep2Use), 1))
	colnames(genData0) <- c("ID", "dose", "response", "x1")
	generatedData <- rbind(generatedData, genData0)
}
## transforming it for clustering
toInput <- inputDataMaker(2, 3, 1, generatedData)
## general pattern clustering
generalPatternClust <- generalPatternClustering(inputData = toInput$inputData, 
colsData = toInput$colsData ,colID = toInput$colID , 
		doseLevels = toInput$doseLevels, numReplications = toInput$numReplicates, 
na.rm = FALSE, imputationMethod = "mean",
		ORICC = "two", transform = "none",plotFormat = "eps", 
LRT = TRUE, MCT = TRUE,
		adjustMethod = "BH",
		nPermute = 100, useSeed = NULL, 
theLeastNumberOfMethods = 2, alpha = 0.05, nCores = 1)



