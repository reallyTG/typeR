library(mztwinreg)


### Name: fam_env
### Title: Linear and logistic regression models for familiar and unique
###   environmental factors
### Aliases: fam_env

### ** Examples

data(flu_weight)

# The linear regression below tests whether the intrapair differences in 
# DNA methylation of a given twin-pair are predicted by its differences in
# either familial (Bb) or environmental (Bw) factors influencing weight 
# (in kilograms). 
(fam_env_linear <- fam_env(DNAmeth ~ Gender + Age + Weight, BbBw="Weight", 
regression='linear', data=flu_weight))

# The linear regression below tests whether the intrapair differences in
# flu (binary outcome) of a given twin-pair are predicted by its differences
# in either familial (Bb) or environmental (Bw) factors influencing weight 
# (in kilograms). 
(fam_env_logistic <- fam_env(FluNow ~ Gender + Age + Weight, BbBw="Weight", 
regression='logistic', data=flu_weight))



