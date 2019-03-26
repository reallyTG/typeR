library(finalfit)


### Name: coxphuni
### Title: Cox proprotional hazards univariable models: 'finalfit' model
###   wrapper
### Aliases: coxphuni

### ** Examples

# Cox Proportional Hazards univariable analysis.
library(finalfit)
library(dplyr)

explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "Surv(time, status)"
colon_s %>%
	coxphuni(dependent, explanatory) %>%
	fit2df()



