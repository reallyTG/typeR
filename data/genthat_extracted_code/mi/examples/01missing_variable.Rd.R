library(mi)


### Name: 01missing_variable
### Title: Class "missing_variable" and Inherited Classes
### Aliases: 01missing_variable missing_variable missing_variable-class
###   MatrixTypeThing-class WeAreFamily-class
### Keywords: classes AimedAtUseRs DirectedTowardDevelopeRs

### ** Examples

# STEP 0: GET DATA
data(nlsyV, package = "mi")

# STEP 0.5 CREATE A missing_variable (you never need to actually do this)
income <- missing_variable(nlsyV$income, type = "continuous")
show(income)

# STEP 1: CONVERT IT TO A missing_data.frame
mdf <- missing_data.frame(nlsyV) # this calls missing_variable() internally
show(mdf)



