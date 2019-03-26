library(ARPobservation)


### Name: interim_bounds
### Title: Interim bounds and confidence interval
### Aliases: interim_bounds

### ** Examples

# Estimate bounds on the interim time ratio for Carl from the Moes dataset
data(Moes)
with(subset(Moes, Case == "Carl"),
interim_bounds(PIR = outcome, phase = Phase, base_level = "No Choice"))



