library(preference)


### Name: preference.trial
### Title: Create a Preference Trial
### Aliases: preference.trial

### ** Examples


# Unstratified single trial.
preference.trial(pref_ss=100, pref_effect=1, selection_ss=100, 
  selection_effect=1, treatment_ss=100, treatment_effect=1,
  sigma2=1, pref_prop=0.6)

# Stratified single trial.
preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
  selection_effect=1, treatment_ss=100, treatment_effect=1,
  sigma2=list(c(1, 0.8)), pref_prop=list(c(0.6, 0.3)),
  choice_prop=0.5, stratum_prop=list(c(0.3, 0.7)))

# Multiple trials unstratified.
preference.trial(pref_ss=100, pref_effect=seq(0.1, 2, by=0.5), 
  selection_ss=100, selection_effect=1, treatment_ss=100, 
  treatment_effect=1, sigma2=1, pref_prop=0.6)

# Multiple, stratified trials.
preference.trial(pref_ss=100, pref_effect=seq(0.1, 2, by=0.5), 
  selection_ss=100, selection_effect=1, treatment_ss=100, 
  treatment_effect=1, sigma2=list(c(1, 0.8)), pref_prop=list(c(0.6, 0.3)), 
  choice_prop=0.5, stratum_prop=list(c(0.3, 0.7)))




