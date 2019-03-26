library(poweRlaw)


### Name: bootstrap
### Title: Estimating the lower bound (xmin)
### Aliases: bootstrap bootstrap_p get_distance_statistic estimate_xmin

### ** Examples

###################################################
# Load the data set and create distribution object#
###################################################
x = 1:10
m = displ$new(x)

###################################################
# Estimate xmin and pars                          #
###################################################
est = estimate_xmin(m)
m$setXmin(est)

###################################################
# Bootstrap examples                              #    
###################################################
## Not run: 
##D bootstrap(m, no_of_sims=1, threads=1)
##D bootstrap_p(m, no_of_sims=1, threads=1)
## End(Not run)



