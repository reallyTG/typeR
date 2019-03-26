library(spartan)


### Name: generate_emulators_and_ensemble
### Title: Generate a set of emulators and combine into an ensemble
### Aliases: generate_emulators_and_ensemble

### ** Examples

sampleMaxes <- cbind(100,0.9,0.5,0.08,1,5)
sampleMins <-cbind(0,0.1,0.1,0.015,0.1,0.25)
modelList <- c("RF","GLM")
measures<-c("Velocity")
parameters<-c("stableBindProbability","chemokineExpressionThreshold",
"initialChemokineExpressionValue","maxChemokineExpressionValue",
"maxProbabilityOfAdhesion","adhesionFactorExpressionSlope")
data("sim_data_for_emulation")
partitionedData <- partition_dataset(sim_data_for_emulation[,1:7], parameters,
measures, percent_train=75, percent_test=15, percent_validation=10, normalise=TRUE,
sample_mins = sampleMins, sample_maxes = sampleMaxes)
generated_ensemble<-generate_emulators_and_ensemble(modelList, parameters,
measures, partitionedData, normalised=TRUE)






