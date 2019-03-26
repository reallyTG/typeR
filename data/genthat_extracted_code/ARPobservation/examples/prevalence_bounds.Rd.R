library(ARPobservation)


### Name: prevalence_bounds
### Title: Prevalence bounds and confidence interval
### Aliases: prevalence_bounds

### ** Examples

# Estimate bounds on the prevalence ratio for Carl from Moes dataset
data(Moes)
with(subset(Moes, Case == "Carl"),
 prevalence_bounds(PIR = outcome, phase = Phase, base_level = "No Choice",
 mu_L = 10, active_length = active_length, intervals = intervals))



