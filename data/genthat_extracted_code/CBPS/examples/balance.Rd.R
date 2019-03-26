library(CBPS)


### Name: balance
### Title: Optimal Covariate Balance
### Aliases: balance

### ** Examples


###
### Example: Assess Covariate Balance
###
data(LaLonde)
## Estimate CBPS
fit <- CBPS(treat ~ age + educ + re75 + re74 + 
			I(re75==0) + I(re74==0), 
			data = LaLonde, ATT = TRUE)
balance(fit)




