library(clustDRM)


### Name: plotSimulDRM
### Title: plot results of the simulation study
### Aliases: plotSimulDRM

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
for (iGen in 2:20){
genData0 <- cbind(rep(iGen,sum(numRep2Use)), 
MCPMod::genDFdata("logistic",c(5, 3, 10, 0.05), doses2Use, 
numRep2Use, 1), 
			matrix(rnorm(1*sum(numRep2Use)), sum(numRep2Use), 1))
	colnames(genData0) <- c("ID", "dose", "response", "x1")
	generatedData <- rbind(generatedData, genData0)
}
simRes <- simulEvalDRM (pilotData = 
generatedData[generatedData$ID == 2, c(2,3)], 
doseLevels = c(0, 4, 20), 
		numReplications = c(6, 3, 3), numSim = 10, 
standardDeviation = 1, EDp = 0.5,
		funcList = c("linlog", "emax", "sigEmax", "logistic"))
# plot the simulated results
plotSimulDRM(simRes, quantity2Plot = "mse")



