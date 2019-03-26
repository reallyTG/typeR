library(ClinicalTrialSummary)


### Name: ypsummary
### Title: The main function of the package provides five summary measures
###   of the treatment effect for clinical trials.
### Aliases: ypsummary ypsummary.default summary.ypsummary print.ypsummary

### ** Examples

library(ClinicalTrialSummary)
data(ggas)
time <- ggas$time
event <- ggas$event
group <- ggas$group
result <- ypsummary(time, event, group, tau=8.2) # tau must be supplied.
result
summary(result)



