library(ARPobservation)


### Name: incidence_bounds
### Title: Incidence bounds and confidence interval
### Aliases: incidence_bounds

### ** Examples

# Estimate bounds on the incidence ratio for Ahmad from the Dunlap dataset
data(Dunlap)
with(subset(Dunlap, Case == "Ahmad"),
incidence_bounds(PIR = outcome, phase = Phase, base_level = "No Choice",
                 mu_U = 10, p = .15, active_length = active_length, intervals = intervals))



