library(CBPS)


### Name: CBIV
### Title: Covariate Balancing Propensity Score for Instrumental Variable
###   Estimates (CBIV)
### Aliases: CBIV

### ** Examples


###
### Example: propensity score matching
### (Need to fix when we have an actual example).

##Load the LaLonde data
data(LaLonde)
## Estimate CBPS
fit <- CBPS(treat ~ age + educ + re75 + re74 + 
			I(re75==0) + I(re74==0), 
			data = LaLonde, ATT = TRUE)
summary(fit)





