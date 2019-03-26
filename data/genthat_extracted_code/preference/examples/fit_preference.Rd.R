library(preference)


### Name: fit_preference
### Title: Fit the Preference Data Collected from a Two-stage Clinical
###   Trial
### Aliases: fit_preference

### ** Examples

# Unstratified
outcome <- c(10, 8, 6, 10, 5, 8, 7, 6, 10, 12, 11, 6, 8, 10, 5, 7, 9, 
             12, 6, 8, 9, 10, 7, 8,11)
arm <- c(rep("choice", 13), rep("random", 12))
treatment <- c(rep(1, 5), rep(2, 8), rep(1, 6), rep(2, 6))
fit_preference(outcome, arm, treatment)

# Stratified
# Same data plus strata information.
strata <- c(1,1,2,2,2,1,1,1,1,2,2,2,2,1,1,1,2,2,2,1,1,1,2,2,2)
fit_preference(outcome, arm, treatment, strata, alpha=0.1)



