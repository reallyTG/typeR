library(LPower)


### Name: LPower
### Title: Calculates either the power, sample size, or detectable effect
###   for a longitudinal study with a repeated measures design.
### Aliases: LPower
### Keywords: ~design

### ** Examples

#This would be what would be used for an analysis of covariance assuming
#a correlation of 0.3 and a standard deviation of 5.46.
LPower(sample_size=60,power=.8,
     xMatrix=list(matrix(c(1,1,0,1,0,0),2,3),matrix(c(1,1,0,1,0,1),2,3)),
     vMatrix=5.46^2*matrix(c(1,0.3,0.3,1),2,2),attritionRates=0.1)



