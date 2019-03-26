library(OutrankingTools)


### Name: Electre_tri
### Title: ELECTRE TRI Method
### Aliases: Electre_tri
### Keywords: ELECTRE methods Sorting problem Aggregation/disaggregation
###   approaches Multi-criteria decision aiding

### ** Examples


# the performance table

performanceMatrix <- cbind(
c(-120.0,-150.0,-100.0,-60,-30.0,-80,-45.0),
c(-284.0,-269.0,-413.0,-596,-1321.0,-734,-982.0),				
c(5.0,2.0,4.0,6,8.0,5,7.0),					
c(3.5,4.5,5.5,8,7.5,4,8.5),		
c(18.0,24.0,17.0,20,16.0,21,13.0)
)
# Vector containing names of alternatives

alternatives <- c("a1","a2","a3","a4","a5","a6","a7")

# Vector containing names of criteria

criteria <- c( "g1","g2","g3","g4","g5")
criteriaWeights <- c(0.25,0.45,0.10,0.12,0.08)

# vector indicating the direction of the criteria evaluation .

minmaxcriteria <- c("max","max","max","max","max")

# Matrix containing the profiles.

profiles <- cbind(c(-100,-50),c(-1000,-500),c(4,7),c(4,7),c(15,20))

#  vector defining profiles' names

profiles_names <-c("b1","b2")

# thresholds vector
IndifferenceThresholds <- c(15,80,1,0.5,1)
PreferenceThresholds <- c(40,350,3,3.5,5)
VetoThresholds <- c(100,850,5,4.5,8)

# Testing

Electre_tri(performanceMatrix,
			alternatives,
			profiles,
			profiles_names,
			criteria,
			minmaxcriteria,
			criteriaWeights,
			IndifferenceThresholds,
			PreferenceThresholds,
			VetoThresholds,
			lambda=NULL)



