library(mi)


### Name: semi-continuous-class
### Title: Class "semi-continuous" and Inherited Classes
### Aliases: semi-continuous semi-continuous-class semi-continuous
###   nonnegative-continuous-class nonnegative-continuous
###   SC_proportion-class SC_proportion
### Keywords: classes DirectedTowardDevelopeRs

### ** Examples

# STEP 0: GET DATA
data(nlsyV, package = "mi")

# STEP 0.5 CREATE A missing_variable (you never need to actually do this)
income <- missing_variable(nlsyV$income, type = "nonnegative-continuous")
show(income)



