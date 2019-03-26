library(finalfit)


### Name: coxphmulti
### Title: Cox proprotional hazards multivariable models: 'finalfit' model
###   wrapper
### Aliases: coxphmulti

### ** Examples

# Cox Proportional Hazards multivariable analysis.
library(finalfit)
library(dplyr)

explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "Surv(time, status)"
colon_s %>%
	coxphmulti(dependent, explanatory) %>%
	fit2df()



