library(climwin)


### Name: pvalue
### Title: Determine the probability that a given climate signal is 'true'.
### Aliases: pvalue

### ** Examples


# Calculate PDAICc for the Mass dataset

pvalue(datasetrand = MassRand, dataset = MassOutput, 
      metric = "AIC", sample.size = 47)
      
# Calculate Pc for the Mass dataset

pvalue(datasetrand = MassRand, dataset = MassOutput,
      metric = "C", sample.size = 47) 




