library(HMMmlselect)


### Name: HMMmlselect-package
### Title: Determine the number of states in hidden Markov models via
###   marginal likelihood
### Aliases: HMMmlselect-package

### ** Examples

library(HMMmlselect)

# simulate a 25 observations HMM
obs = HMMsim ( n = 25 )$obs

# perform order selection and estimation
results = HMMmlselect ( y = obs, list(Kfits = c(2,3), boolUseMclust = FALSE) )

# visualize the results, see figure 1
PlotHMM ( y = obs, results )



