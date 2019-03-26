library(preference)


### Name: plot.preference.trial
### Title: Plot the effect sizes of a preference trial
### Aliases: plot.preference.trial

### ** Examples


# Plot trials with fixed power and varying preference effect.
trials <- pt_from_power(power = 0.8, pref_effect = seq(0.5, 2, by = 0.1), 
                        selection_effect = 1, treatment_effect = 1, 
                        sigma2 = 1, pref_prop = 0.6)
plot(trials)
 
# Plot trials with fixed power and varying selection effect.
trials <- pt_from_power(power = 0.8, pref_effect = 1,
                        selection_effect = seq(0.5, 2, by = 0.1), 
                        treatment_effect = 1, sigma2 = 1, pref_prop = 0.6)
plot(trials)

# Plot trials with fixed power and varying preference and 
# selection effects.

# the selection effects of interest
selection_effects <- rep(seq(0.5, 2, by = 0.1), 4)

# the preference effects to condition on
pref_effects <- rep(seq(0.4, 1, by = 0.2), 
                    each = length(selection_effects)/4)

trials <- pt_from_power(power = 0.8, pref_effect = pref_effects,
                        selection_effect = selection_effects,
                        treatment_effect = 1, sigma2 = 1, pref_prop = 0.6)
plot(trials)
 




