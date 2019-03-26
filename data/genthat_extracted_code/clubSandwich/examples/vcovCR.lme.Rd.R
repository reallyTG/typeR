library(clubSandwich)


### Name: vcovCR.lme
### Title: Cluster-robust variance-covariance matrix for an lme object.
### Aliases: vcovCR.lme

### ** Examples

library(nlme)
rat_weight <- lme(weight ~ Time * Diet, data=BodyWeight, ~ Time | Rat) 
vcovCR(rat_weight, type = "CR2")

data(egsingle, package = "mlmRev")
math_model <- lme(math ~ year * size + female + black + hispanic, 
                  random = list(~ year | schoolid, ~ 1 | childid), 
                  data = egsingle)
vcovCR(math_model, type = "CR2")




