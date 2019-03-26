library(mztwinreg)


### Name: abs_dif
### Title: Test for intrapair phenotypic differences based on pair-level
###   predictor variables
### Aliases: abs_dif

### ** Examples

data(flu_weight)

# The linear regression below tests whether the intrapair differences in 
# DNA methylation (outcome) depend on pair-specific variables such as gender, 
# age or both. 
# The conceptual justification of the working hypothesis is partly inspired 
# by Fraga, M. F., et al. (2005) Proceedings of the National Academy of 
# Sciences of the United States of America, 102(30), 10604-10609.
(variability_linear <- abs_dif(DNAmeth ~ Gender + Age, data=flu_weight, regression='linear'))

# The logistic regression below tests whether or not there was an 
# increased/decreased rate of phenotypic differences in flu liability during 
# childhood in males, compared with females. 
# Namely, it evaluates there were more intrapair differences in flu liability 
# in one of the genders (male or female).  
(variability_logistic <- abs_dif(FluChild ~ Gender, data=flu_weight, regression='logistic'))



