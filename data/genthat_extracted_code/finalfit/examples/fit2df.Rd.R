library(finalfit)


### Name: fit2df
### Title: Extract model fit results to dataframe (generic): 'finalfit'
###   model extractors
### Aliases: fit2df fit2df.lm fit2df.lmlist fit2df.glm fit2df.glmboot
###   fit2df.glmlist fit2df.lmerMod fit2df.glmerMod fit2df.coxph
###   fit2df.coxphlist

### ** Examples

library(finalfit)
library(dplyr)
library(survival)
# glm
fit = glm(mort_5yr ~  age.factor + sex.factor + obstruct.factor + perfor.factor,
  data=colon_s, family="binomial")
fit %>%
  fit2df(estimate_suffix=" (multivariable)")

# glmlist
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "mort_5yr"
colon_s %>%
	glmmulti(dependent, explanatory) %>%
	fit2df(estimate_suffix=" (univariable)")

# glmerMod
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
random_effect = "hospital"
dependent = "mort_5yr"
colon_s %>%
  glmmixed(dependent, explanatory, random_effect) %>%
	 fit2df(estimate_suffix=" (multilevel")

# glmboot
## Note number of draws set to 100 just for speed in this example
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "mort_5yr"
colon_s %>%
	glmmulti_boot(dependent, explanatory,  R = 100) %>%
	fit2df(estimate_suffix=" (multivariable (BS CIs))")

# lm
fit = lm(nodes ~  age.factor + sex.factor + obstruct.factor + perfor.factor,
  data=colon_s)
fit %>%
  fit2df(estimate_suffix=" (multivariable)")

# lmerMod
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
random_effect = "hospital"
dependent = "nodes"

colon_s %>%
  lmmixed(dependent, explanatory, random_effect) %>%
	 fit2df(estimate_suffix=" (multilevel")

# coxphlist
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "Surv(time, status)"

colon_s %>%
	coxphuni(dependent, explanatory) %>%
	fit2df(estimate_suffix=" (univariable)")

colon_s %>%
	coxphmulti(dependent, explanatory) %>%
	fit2df(estimate_suffix=" (multivariable)")

# coxph
fit = coxph(Surv(time, status) ~ age.factor + sex.factor + obstruct.factor + perfor.factor,
  data = colon_s)

fit %>%
	fit2df(estimate_suffix=" (multivariable)")



