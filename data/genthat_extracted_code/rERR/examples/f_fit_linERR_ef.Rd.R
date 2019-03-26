library(rERR)


### Name: f_fit_linERR_ef
### Title: fit Excess Relative Risk Model
### Aliases: f_fit_linERR_ef

### ** Examples

# set the formulas for the models
formula1  <- Surv(entry_age,exit_age,outcome) ~ lin(dose_cum) + strata(sex)
formula2  <- Surv(entry_age,exit_age,outcome) ~ loglin(factor(country)) + lin(dose_cum) +
                                                strata(sex)

# fit the models
fit1 <- f_fit_linERR_ef(formula1,data=cohort_ef,id_name="id",dose_name="dose",
                        time_name="age",covars_names=c("sex"),lag=2,exclusion_done=TRUE)
fit2 <- f_fit_linERR_ef(formula2,data=cohort_ef,id_name="id",dose_name="dose",
                        time_name="age",covars_names=c("sex","country"),lag=2,exclusion_done=TRUE)

# display a summary
summary(fit1)
summary(fit2)

# confidence intervals
confint(fit1)
confint(fit2)

# likelihood ratio test between nested and nesting models
f_lrt(fit1,fit2)



