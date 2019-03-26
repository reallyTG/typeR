library(mztwinreg)


### Name: log_dif
### Title: Test for intrapair logarithm-based phenotypic differences based
###   on pair-level predictor variables
### Aliases: log_dif

### ** Examples

data(flu_weight)

# The linear regression below tests whether DNA methylation differences at a
# given locus are predicted by pair level variables (such as gender, age 
# or both). 
(logarithm_differences <- log_dif(DNAmeth ~ Gender + Age, data=flu_weight))



