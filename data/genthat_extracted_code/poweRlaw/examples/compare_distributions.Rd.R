library(poweRlaw)


### Name: compare_distributions
### Title: Vuong's test for non-nested models
### Aliases: compare_distributions

### ** Examples

########################################################
# Example data                                         #
########################################################
x = rpldis(100, xmin=2, alpha=3)

########################################################
##Continuous power law                                 #
########################################################
m1 = conpl$new(x)
m1$setXmin(estimate_xmin(m1))

########################################################
##Exponential           
########################################################
m2 = conexp$new(x)
m2$setXmin(m1$getXmin())
est2 = estimate_pars(m2)
m2$setPars(est2$pars)

########################################################
##Vuong's test                                         #
########################################################
comp = compare_distributions(m1, m2)
plot(comp)



