library(preference)


### Name: pt_from_power
### Title: Design Preference Trials with Power Constraint(s)
### Aliases: pt_from_power

### ** Examples


# Unstratified trials with power constraints.
pt_from_power(power=seq(.1, 0.8, by=0.1), pref_effect=1, selection_effect=1, 
  treatment_effect=1, sigma2=1, pref_prop=0.6)

# Stratified trials with power constraints. Note that the proportion
# of patients in the choice arm (choice prop) is fixed for all strata.
pt_from_power(power=seq(0.1, 0.8, by=0.1), pref_effect=1, 
  selection_effect=1, treatment_effect=1,
  sigma2=list(c(1, 0.8)), pref_prop=list(c(0.6, 0.3)),
  choice_prop=0.5, stratum_prop=list(c(0.3, 0.7)))

# or...

pt_from_power(power=seq(0.1, 0.8, by=0.1), pref_effect=1, 
  selection_effect=1, treatment_effect=1,
  sigma2=c(1, 0.8), pref_prop=c(0.6, 0.3),
  choice_prop=0.5, stratum_prop=c(0.3, 0.7))




