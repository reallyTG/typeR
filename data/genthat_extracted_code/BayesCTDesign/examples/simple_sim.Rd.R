library(BayesCTDesign)


### Name: simple_sim
### Title: Two Arm Bayesian Clinical Trial Simulation without Historical
###   Data
### Aliases: simple_sim

### ** Examples

#Run a Weibull simulation, using simple_sim().
#For meaningful results, trial_reps needs to be much larger than 2.
weibull_test <- simple_sim(trial_reps = 2, outcome_type = "weibull",
                           subj_per_arm = c(50, 100, 150, 200),
                           effect_vals = c(0.6, 1, 1.4),
                           control_parms = c(2.82487,3), time_vec = NULL,
                           censor_value = NULL, alpha = 0.05,
                           get_var = TRUE, get_bias = TRUE, get_mse = TRUE,
                           seedval=123, quietly=TRUE)

#Tabulate the simulation results for power.
test_table <- print_table(bayes_ctd_array=weibull_test, measure="power",
                          tab_type=NULL, subj_per_arm_val=NULL, a0_val=NULL,
                          effect_val=NULL, rand_control_diff_val=NULL)
print(test_table)

#Create a plot of the power simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="power", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE)
#Create a plot of the estimated hazard ratio simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="est", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE)
#Create a plot of the hazard ratio variance simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="var", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE)
#Create a plot of the hazard ratio bias simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="bias", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE)
#Create a plot of the hazard ratio mse simulation results.
plot_table(bayes_ctd_array=weibull_test, measure="mse", tab_type=NULL,
           smooth=FALSE, plot_out=TRUE)



