library(clustDRM)


### Name: inputDataMaker
### Title: Creating suitable inputData for clustering of the dose-response
###   curve patterns
### Aliases: inputDataMaker

### ** Examples

 
## gnerating data
set.seed(11)
doses2Use <-  c(0, 5, 20)
numRep2Use <- c(3, 3, 3)
generatedData <- cbind(rep(1,sum(numRep2Use)), 
MCPMod::genDFdata("logistic",c(5, 3, 10, 0.05), 
doses2Use, numRep2Use, 1), 
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
## transforming it for clustering
toInput <- inputDataMaker(2, 3, 1, generatedData)




