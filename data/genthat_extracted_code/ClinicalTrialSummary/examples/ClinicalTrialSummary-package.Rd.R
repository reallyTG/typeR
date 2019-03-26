library(ClinicalTrialSummary)


### Name: ClinicalTrialSummary-package
### Title: Summary Measures for Clinical Trials with Survival Outcomes
### Aliases: ClinicalTrialSummary-package
### Keywords: Survival analysis, Clinical trials, Hazard ratio, Yang and
###   Prentice model

### ** Examples

	library(ClinicalTrialSummary)
	data(ggas)
	result <- ypsummary(time=ggas$time, event=ggas$event, group=ggas$group, tau = 8.2)
	print(result)
	summary(result)



