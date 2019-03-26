library(OutrankingTools)


### Name: Electre3_SimpleThresholds
### Title: ELECTRE III using non affine form of the thresholds
### Aliases: Electre3_SimpleThresholds
### Keywords: ELECTRE methods Outranking approaches preference modelling,
###   multicriteria analysis pseudo-criterion Discrimination thresholds

### ** Examples


# the performance table
performanceMatrix <- cbind(
							c(-14,129,-10,44,-14),
							c(90,100,50,90,100),
							c(0,0,0,0,0),
							c(40,0,10,5,20),
							c(100,0,100,20,40)
)

# Vector containing names of alternatives

alternatives <- c("Project1","Project2","Project3","Project4","Project5")

# Vector containing names of criteria

criteria <- c( "CR1","CR2","CR3","CR4","CR5")

#  vector indicating the direction of the criteria evaluation 

minmaxcriteria <- c("max","max","max","max","max")

# criteriaWeights vector

# thresholds vector

IndifferenceThresholds <- c(25,16,0,12,10)
PreferenceThresholds <- c(50,24,1,24,20)
VetoThresholds <- c(100,60,2,48,90)
criteriaWeights <- c(1,1,1,1,1)

# Vector containing the mode of definition which 
# indicates the mode of calculation of the thresholds.


# Testing

Electre3_SimpleThresholds(performanceMatrix,
							alternatives,
							criteria,
							minmaxcriteria,
							criteriaWeights,
							IndifferenceThresholds,
							PreferenceThresholds,
							VetoThresholds)



