library(funtimes)


### Name: beales
### Title: Beale's Estimator and Sample Size
### Aliases: beales
### Keywords: power sample ts

### ** Examples

#Some hypothetical data for monthly river discharge 
#and corresponding nutrient loads:
discharge <- c(NA, 50, 90, 100, 80, 90, 100, 90, 80, 70, NA, NA)
loads <- c(33, 22, 44, 48, NA, 44, 49, NA, NA, 36, NA, NA)

#Example 1:
#Estimate total annual load (12 months), 
#with 90% confidence intervals
beales(discharge, loads, level = 0.9)

#Example 2:
#Calculate sample size required for 90% confidence intervals 
#with a margin of error 30 units
beales(discharge, loads, level = 0.9, d = 30)




