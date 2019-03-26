library(finalfit)


### Name: ff_merge
### Title: Merge a 'summary_factorlist()' table with any number of model
###   results tables.
### Aliases: ff_merge finalfit_merge

### ** Examples

library(finalfit)
library(dplyr)

data(colon_s)
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
explanatory_multi = c("age.factor", "obstruct.factor")
random_effect = "hospital"
dependent = "mort_5yr"

# Create separate tables
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
	select(-c(fit_id, index)) -> example.final
example.final



