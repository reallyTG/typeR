library(rERR)


### Name: f_plot_linERR_ef
### Title: plot likelihood function from ef
### Aliases: f_plot_linERR_ef

### ** Examples

# set the formulas for the models
formula1  <- Surv(entry_age,exit_age,outcome) ~ lin(dose_cum) + strata(sex)

# fit the model
fit1 <- f_fit_linERR_ef(formula1,data=cohort_ef,id_name="id",dose_name="dose",
                        time_name="age",covars_names=c("sex"),lag=2,exclusion_done=TRUE)
                        
# plot the partial loglikelihood function
f_plot_linERR_ef(fit1,formula1,data=cohort_ef,id_name="id",dose_name="dose",
                        time_name="age",covars_names=c("sex"),lag=2,exclusion_done=TRUE)



