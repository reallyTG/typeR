library(clustDRM)


### Name: plotDoseResponseData
### Title: plot dose-response curves
### Aliases: plotDoseResponseData

### ** Examples

## gnerating data, a sample of size 20
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
MCPMod::genDFdata("logistic",c(5, 3, 10, 0.05), 
doses2Use, numRep2Use, 1), 
			matrix(rnorm(1*sum(numRep2Use)), sum(numRep2Use), 1))
colnames(genData0) <- c("ID", "dose", "response", "x1")
generatedData <- rbind(generatedData, genData0)
}
## plotting dose response relation
plotDoseResponseData(generatedData, 2, 3, 1, 2)
## transforming it for clustering
plotDoseResponseData(generatedData, 2, 3, 1, 2, 
addMean = FALSE, 
		drcPattern = "increasing")




