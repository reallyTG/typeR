library(mi)


### Name: categorical
### Title: Class "categorical" and Inherited Classes
### Aliases: categorical categorical-class unordered-categorical-class
###   ordered-categorical-class interval-class binary-class
###   grouped-binary-class
### Keywords: classes DirectedTowardDevelopeRs

### ** Examples

# STEP 0: GET DATA
data(nlsyV, package = "mi")

# STEP 0.5 CREATE A missing_variable (you never need to actually do this)
momrace <- missing_variable(as.factor(nlsyV$momrace), type = "unordered-categorical")
show(momrace)



