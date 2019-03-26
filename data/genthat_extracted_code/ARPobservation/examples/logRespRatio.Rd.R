library(ARPobservation)


### Name: logRespRatio
### Title: Calculate log-response ratio, variance, and confidence interval
### Aliases: logRespRatio

### ** Examples

# Estimate the log response ratio and its variance for Carl from Moes dataset
data(Moes)
with(subset(Moes, Case == "Carl"),
logRespRatio(observations = outcome, phase = Phase, base_level = "No Choice"))



