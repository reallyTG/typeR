library(ARPobservation)


### Name: PIR_MOM
### Title: Moment estimator for prevalence and incidence, with bootstrap
###   confidence intervals
### Aliases: PIR_MOM

### ** Examples

# Estimate prevalence and incidence ratios for Carl from the Moes dataset
data(Moes)
with(subset(Moes, Case == "Carl"),
PIR_MOM(PIR = outcome, phase = Phase, intervals = intervals,
interval_length = (active_length + rest_length), rest_length = rest_length,
base_level = "No Choice", seed = 149568373))



