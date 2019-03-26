library(CBPS)


### Name: vcov.CBPS
### Title: Calculate Variance-Covariance Matrix for a Fitted CBPS Object
### Aliases: vcov.CBPS

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





