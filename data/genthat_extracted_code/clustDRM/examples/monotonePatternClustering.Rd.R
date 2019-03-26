library(clustDRM)


### Name: monotonePatternClustering
### Title: clustering dose-response curves based on their pattern when it
###   is known to be monotone. function to cluster dose-response curves
###   based on their pattern.
### Aliases: monotonePatternClustering

### ** Examples

## gnerating data, a sample of size 20
set.seed(11)
doses2Use <-  c(0, 5, 20)
numRep2Use <- c(3, 3, 3)
generatedData <- cbind(rep(1,sum(numRep2Use)), 
MCPMod::genDFdata("logistic",c(5, 3, 10, 0.05), 
doses2Use, numRep2Use, 1), 
		matrix(rnorm(1*sum(numRep2Use)), sum(numRep2Use), 1))
colnames(generatedData) <- c("ID", "dose", "response", "x1")
for (iGen in 2:20){
	genData0 <- cbind(rep(iGen,sum(numRep2Use)), 
MCPMod::genDFdata("logistic",c(5, 3, 10, 0.05), 
doses2Use, numRep2Use, 1), 
			matrix(rnorm(1*sum(numRep2Use)), sum(numRep2Use), 1))
	colnames(genData0) <- c("ID", "dose", "response", "x1")
	generatedData <- rbind(generatedData, genData0)
}
## transforming it for clustering
toInput <- inputDataMaker(2, 3, 1, generatedData)
## monotone pattern clustering
monotonePatternClust <- monotonePatternClustering (inputData = 
toInput$inputData, colsData = toInput$colsData ,
		colID = toInput$colID, doseLevels = toInput$doseLevels, 
numReplications = toInput$numReplicates, 
		BHorBY = TRUE, SAM = FALSE, testType = c("E2"),
		adjustType = "BH", FDRvalue = c(0.05, 0.05), 
nPermute= c(100, 100), fudgeSAM = "pooled",
		useSeed = c(NULL, NULL), theLeastNumberOfTests = 1, 
na.rm = FALSE, imputationMethod = "mean")




