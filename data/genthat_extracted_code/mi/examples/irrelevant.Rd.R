library(mi)


### Name: irrelevant
### Title: Class "irrelevant" and Inherited Classes
### Aliases: irrelevant irrelevant-class fixed-class group-class
### Keywords: classes DirectedTowardDevelopeRs

### ** Examples

# STEP 0: GET DATA
data(nlsyV, package = "mi")

# STEP 0.5 CREATE A missing_variable (you never need to actually do this)
first <- missing_variable(as.factor(nlsyV$first), type = "group")
show(first)



