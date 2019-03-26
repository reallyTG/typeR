library(LRcontrast)


### Name: qLRcontrast
### Title: Simulate quantiles of LR contrast tests in regression models
###   with a lack of identifiability.
### Aliases: qLRcontrast
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Simulate the 90%, 95% and 99% quantiles of the LR contrast tests where the specified 
# models are competing against each other.
# The size of each dose group is equal in this case. 

qLRcontrast(dose = c(0, 0.05, 0.2, 0.6, 1), probs = c(0.9, 0.95, 0.99), 
            weight = c(0.2, 0.2, 0.2, 0.2, 0.2), models = c("linear", "emax", 
            "exponential", "linlog"), nsim = 10)



