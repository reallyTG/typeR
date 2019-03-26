library(rERR)


### Name: f_fit_linERR_wf
### Title: fit Excess Relative Risk Model
### Aliases: f_fit_linERR_wf

### ** Examples

# set the formulas for the models
formula1 <- Surv(AgeAtEntry,age_at_event,outcome) ~ lin(dose_cum) + strata(sex)
formula2 <- Surv(AgeAtEntry,age_at_event,outcome) ~ loglin(factor(country)) + lin(dose_cum) + 
                                                    strata(sex)

  
# fit the models
fit1 <- f_fit_linERR_wf(formula1,data=cohort_wf,id_name="id",doses=cohort_wf[,45:79],
                        times=cohort_wf[,10:44],covars=cohort_wf[,c("sex","country")],
                        lag=2,exclusion_done = FALSE)

fit2 <- f_fit_linERR_wf(formula2,data=cohort_wf,id_name="id",doses=cohort_wf[,45:79],
                        times=cohort_wf[,10:44],covars=cohort_wf[,c("sex","country")],
                        lag=2,exclusion_done = FALSE)

# display a summary
summary(fit1)
summary(fit2)

# confidence intervals
confint(fit1)
confint(fit2) 

# likelihood ratio test between nested and nesting models#' 
f_lrt(fit1,fit2)




