library(spartan)


### Name: partition_dataset
### Title: Partition latin-hypercube summary file to training, testing, and
###   validation
### Aliases: partition_dataset

### ** Examples

data("sim_data_for_emulation")
parameters<-c("stableBindProbability","chemokineExpressionThreshold",
"initialChemokineExpressionValue","maxChemokineExpressionValue",
"maxProbabilityOfAdhesion","adhesionFactorExpressionSlope")
measures<-c("Velocity","Displacement","PatchArea")
sample_maxes <- cbind(100,0.9,0.5,0.08,1,5)
sample_mins <-cbind(0,0.1,0.1,0.015,0.1,0.25)
partitionedData <- partition_dataset(sim_data_for_emulation, parameters,
measures, percent_train=75, percent_test=15, percent_validation=10, normalise=TRUE,
sample_mins = sample_mins, sample_maxes = sample_maxes)




