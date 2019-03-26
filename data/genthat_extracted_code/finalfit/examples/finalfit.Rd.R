library(finalfit)


### Name: finalfit
### Title: Final output tables for common regression models
### Aliases: finalfit finalfit.lm finalfit.glm finalfit.coxph

### ** Examples

library(finalfit)
library(dplyr)

# Summary, univariable and multivariable analyses of the form:
# glm(depdendent ~ explanatory, family="binomial")
# lmuni(), lmmulti(), lmmixed(), glmuni(), glmmulti(), glmmixed(), glmmultiboot(),
#   coxphuni(), coxphmulti()

data(colon_s) # Modified from survival::colon
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = 'mort_5yr'
colon_s %>%
	finalfit(dependent, explanatory)

# Multivariable analysis with subset of explanatory
#   variable set used in univariable analysis
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
explanatory_multi = c("age.factor", "obstruct.factor")
dependent = "mort_5yr"
colon_s %>%
	finalfit(dependent, explanatory, explanatory_multi)

# Summary, univariable and multivariable analyses of the form:
# lme4::glmer(dependent ~ explanatory + (1 | random_effect), family="binomial")

explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
explanatory_multi = c("age.factor", "obstruct.factor")
random_effect = "hospital"
dependent = "mort_5yr"
colon_s %>%
	finalfit(dependent, explanatory, explanatory_multi, random_effect)

# Include model metrics:
colon_s %>%
	finalfit(dependent, explanatory, explanatory_multi,  metrics=TRUE)

# Summary, univariable and multivariable analyses of the form:
# survival::coxph(dependent ~ explanatory)

explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "Surv(time, status)"

colon_s %>%
	finalfit(dependent, explanatory)

# Rather than going all-in-one, any number of subset models can
# be manually added on to a summary_factorlist() table using finalfit.merge().
# This is particularly useful when models take a long-time to run or are complicated.

# Note requirement for fit_id=TRUE.
# `fit2df` is a subfunction extracting most common models to a dataframe.

explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = 'mort_5yr'
colon_s %>%
  finalfit(dependent, explanatory, metrics=TRUE)

explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
explanatory_multi = c("age.factor", "obstruct.factor")
random_effect = "hospital"
dependent = 'mort_5yr'

# Separate tables
colon_s %>%
	summary_factorlist(dependent, explanatory, fit_id=TRUE) -> example.summary

colon_s %>%
	glmuni(dependent, explanatory) %>%
	fit2df(estimate_suffix=" (univariable)") -> example.univariable

colon_s %>%
	glmmulti(dependent, explanatory) %>%
	fit2df(estimate_suffix=" (multivariable)") -> example.multivariable

colon_s %>%
	glmmixed(dependent, explanatory, random_effect) %>%
	fit2df(estimate_suffix=" (multilevel") -> example.multilevel

# Pipe together
example.summary %>%
	finalfit_merge(example.univariable) %>%
	finalfit_merge(example.multivariable) %>%
	finalfit_merge(example.multilevel) %>%
	select(-c(fit_id, index)) %>%
	dependent_label(colon_s, dependent) -> example.final
example.final




