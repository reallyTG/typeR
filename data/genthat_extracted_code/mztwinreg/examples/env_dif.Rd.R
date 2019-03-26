library(mztwinreg)


### Name: env_dif
### Title: Test for intrapair phenotypic differences in an outcome based on
###   intrapair-differences predictor variables
### Aliases: env_dif

### ** Examples

data(flu_weight)

# The linear regression below tests whether the intrapair differences in weight
# (in kilograms) of a given twin-pair predict its intrapair differences in DNA 
# methylation levels at a given genomic locus. 
summary(unique_env_linear <- env_dif(DNAmeth ~ Weight, data=flu_weight))



