library(HMMmlselect)


### Name: HMMsim
### Title: HMMsim
### Aliases: HMMsim

### ** Examples

library(HMMmlselect)

# simulate a 25 observations HMM
obs = HMMsim ( n = 25 )$obs

# perform order selection and estimation
results = HMMmlselect ( y = obs, list(Kfits = c(2,3), boolUseMclust = FALSE) )

# visualize the results, see figure 1
PlotHMM ( y = obs, results )



