library(preference)


### Name: sample_size
### Title: Preference trial parameter accessors
### Aliases: sample_size sample_size.preference.trial power
###   power.preference.trial effect_size effect_size.preference.trial
###   proportion proportion.preference.trial significance
###   significance.preference.trial sigma2 sigma2.preference.trial

### ** Examples

# Create a set of trials with a sequence of preference effects.
trials <- preference.trial(pref_ss=100, pref_effect=seq(0.1, 2, by=0.5), 
                           selection_ss=100, selection_effect=1, 
                           treatment_ss=100, treatment_effect=1, sigma2=1, 
                           pref_prop=0.6)

# the sample sizes
sample_size(trials)

# the powers
power(trials)

# the effect sizes
effect_size(trials)

# the arm proportions
proportion(trials)

# the significance
significance(trials)

# the variance estimates
sigma2(trials)




