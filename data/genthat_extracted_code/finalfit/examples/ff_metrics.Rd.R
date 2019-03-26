library(finalfit)


### Name: ff_metrics
### Title: Generate common metrics for regression model results
### Aliases: ff_metrics ff_metrics.lm ff_metrics.lmlist ff_metrics.glm
###   ff_metrics.glmlist ff_metrics.lmerMod ff_metrics.glmerMod
###   ff_metrics.coxph ff_metrics.coxphlist

### ** Examples

library(finalfit)

# glm
fit = glm(mort_5yr ~  age.factor + sex.factor + obstruct.factor + perfor.factor,
  data=colon_s, family="binomial")
fit %>%
  ff_metrics()

# glmlist
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "mort_5yr"
colon_s %>%
	 glmmulti(dependent, explanatory) %>%
	 ff_metrics()

# glmerMod
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
random_effect = "hospital"
dependent = "mort_5yr"
colon_s %>%
  glmmixed(dependent, explanatory, random_effect) %>%
  ff_metrics()


# lm
fit = lm(nodes ~  age.factor + sex.factor + obstruct.factor + perfor.factor,
				 data=colon_s)
fit %>%
  ff_metrics()

# lmerMod
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
random_effect = "hospital"
dependent = "nodes"

colon_s %>%
  lmmixed(dependent, explanatory, random_effect) %>%
  ff_metrics()

# coxphlist
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "Surv(time, status)"


colon_s %>%
  coxphmulti(dependent, explanatory) %>%
  ff_metrics()

# coxph
fit = survival::coxph(survival::Surv(time, status) ~ age.factor + sex.factor +
  obstruct.factor + perfor.factor,
  data = colon_s)

fit %>%
	ff_metrics()



