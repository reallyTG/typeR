library(mztwinreg)


### Name: env_dif_logistic
### Title: Test for intrapair phenotypic differences in a binary outcome
###   based on intrapair-differences predictor variables
### Aliases: env_dif_logistic

### ** Examples

data(flu_weight)

# The linear regression below tests whether the intrapair differences in flu 
# presence (binary outcome) of a given twin-pair are predicted by its 
# differences in weight (in kilograms). 
summary(unique_env_logistic <- env_dif_logistic(FluNow ~ Weight, data=flu_weight))



