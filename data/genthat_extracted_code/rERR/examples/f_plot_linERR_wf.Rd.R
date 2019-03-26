library(rERR)


### Name: f_plot_linERR_wf
### Title: plot likelihood function from wf
### Aliases: f_plot_linERR_wf

### ** Examples

# set the formulas for the models
formula1  <- Surv(AgeAtEntry,age_at_event,outcome) ~ lin(dose_cum) + strata(sex)

# fit the model
fit1 <- f_fit_linERR_wf(formula1,data=cohort_wf,id_name="id",doses=cohort_wf[,45:79],
                        times=cohort_wf[,10:44],covars=cohort_wf[,c("sex","country")],
                        lag=2,exclusion_done = FALSE)
                        
# plot the partial loglikelihood function
f_plot_linERR_wf(fit1,formula1,data=cohort_wf,id_name="id",doses=cohort_wf[,45:79],
                 times=cohort_wf[,10:44],covars=cohort_wf[,c("sex","country")],
                 lag=2,exclusion_done = FALSE)



