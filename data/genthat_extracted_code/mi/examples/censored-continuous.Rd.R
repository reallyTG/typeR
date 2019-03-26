library(mi)


### Name: censored-continuous-class
### Title: The "censored-continuous" Class, the "truncated-continuous"
###   Class and Inherited Classes
### Aliases: truncated-continuous-class truncated-continuous
###   FF_truncated-continuous-class FN_truncated-continuous-class
###   NF_truncated-continuous-class NN_truncated-continuous-class
###   censored-continuous-class censored-continuous
###   FF_censored-continuous-class FN_censored-continuous-class
###   NF_censored-continuous-class NN_censored-continuous-class
### Keywords: classes DirectedTowardDevelopeRs

### ** Examples

# STEP 0: GET DATA
data(CHAIN, package = "mi")

# STEP 0.5 CREATE A missing_variable (you never need to actually do this)
#log_virus <- missing_variable(CHAIN$log_virus, type = "NN_censored-continuous", 
#                              lower = 0, upper = Inf)
#show(log_virus)



