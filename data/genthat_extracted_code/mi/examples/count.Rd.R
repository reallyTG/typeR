library(mi)


### Name: count-class
### Title: Class "count"
### Aliases: count-class
### Keywords: classes DirectedTowardDevelopeRs

### ** Examples

# STEP 0: GET DATA
data(CHAIN, package = "mi")

# STEP 0.5 CREATE A missing_variable (you never need to actually do this)
age <- missing_variable(as.integer(CHAIN$age), type = "count")
show(age)



