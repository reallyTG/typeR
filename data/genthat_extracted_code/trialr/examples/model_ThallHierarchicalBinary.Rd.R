library(trialr)


### Name: model_ThallHierarchicalBinary
### Title: Stan model for Thall et al.'s hierarchical Bayesian model for
###   binary data
### Aliases: model_ThallHierarchicalBinary ThallHierarchicalBinary

### ** Examples

# Hierarchical model for responses in a disease with multiple subtypes
dat <- thallhierarchicalbinary_parameters_demo()
samp <- rstan::sampling(stanmodels$ThallHierarchicalBinary, data = dat)
rstan::plot(samp, pars = 'p') # Plot the modelled response rates in the subtypes



