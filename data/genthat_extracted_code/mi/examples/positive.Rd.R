library(mi)


### Name: positive-continuous-class
### Title: Class "positive-continuous" and Inherited Classes
### Aliases: positive-continuous-class proportion-class
### Keywords: classes DirectedTowardDevelopeRs

### ** Examples

# STEP 0: GET DATA
data(CHAIN, package = "mi")

# STEP 0.5 CREATE A missing_variable (you never need to actually do this)
healthy <- missing_variable(CHAIN$healthy / 100, type = "proportion")
show(healthy)



