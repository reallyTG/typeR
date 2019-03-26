library(CBPS)


### Name: vcov_outcome
### Title: Calculate Variance-Covariance Matrix for Outcome Model
### Aliases: vcov_outcome

### ** Examples


###
### Example: Variance-Covariance Matrix
###

##Load the LaLonde data
data(LaLonde)
## Estimate CBPS via logistic regression
fit <- CBPS(treat ~ age + educ + re75 + re74 + I(re75==0) + I(re74==0), 
		    data = LaLonde, ATT = TRUE)
## Get the variance-covariance matrix.
vcov(fit)




