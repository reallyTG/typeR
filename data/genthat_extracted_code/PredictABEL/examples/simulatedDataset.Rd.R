library(PredictABEL)


### Name: simulatedDataset
### Title: Function to construct a simulated dataset containing individual
###   genotype data, genetic risks and disease status for a hypothetical
###   population.
### Aliases: simulatedDataset
### Keywords: models

### ** Examples
# specify the matrix containing the ORs and frequencies of genetic variants 
# In this example we used per allele effects of the risk variants
ORfreq<-cbind(c(1.35,1.20,1.24,1.16), rep(1,4), c(.41,.29,.28,.51),rep(1,4))

# specify the population disease risk
popRisk <- 0.3
# specify size of hypothetical population
popSize <- 10000

# Obtain the simulated dataset
Data <- simulatedDataset(ORfreq=ORfreq, poprisk=popRisk, popsize=popSize)

# Obtain the AUC and produce ROC curve
plotROC(data=Data, cOutcome=4, predrisk=Data[,3])


